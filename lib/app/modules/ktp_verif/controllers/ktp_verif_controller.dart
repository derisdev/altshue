import 'package:altshue/app/modules/ktp_verif/providers/ktp_verif_provider.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class KtpVerifController extends GetxController {
  final TextEditingController? noKTPC = TextEditingController();
  final TextEditingController? fotoKTPC = TextEditingController();
  final TextEditingController? alamatC = TextEditingController();

  final isErrornoKTP = false.obs;
  final isErrorAlamat = false.obs;
  final isErrorFotoKTP = false.obs;
  final imagePath = ''.obs;
  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  void submit() async {
    if (imagePath.value.isNotEmpty) {
      isErrorFotoKTP.value = false;
    } else {
      isErrorFotoKTP.value = true;
    }
    if (formGlobalKey.currentState!.validate() &&
        !isErrornoKTP.value &&
        !isErrorAlamat.value &&
        imagePath.value.isNotEmpty) {
      isLoadingButton.value = true;
      dio.FormData dataKTP = dio.FormData.fromMap({
        "Ektp": await dio.MultipartFile.fromFile(
          imagePath.value,
          filename: fotoKTPC!.text,
        ),
        ' EktpId': noKTPC!.text,
        ' Address': alamatC!.text,
      });

      KTPVerifProvider().kTPVerif(dataKTPVerif: dataKTP).then((response) {
        isLoadingButton.value = false;

        if (response.status == 200) {
          Get.offAllNamed(Routes.HOME);
        } else {
          showToasts(text: response.message);
        }
      });
    }
  }

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
      fotoKTPC!.text = image.path.split('image_picker').last;
      isErrorFotoKTP.value = false;
    } else {
      imagePath.value = '';
    }
  }

  @override
  void dispose() {
    noKTPC!.dispose();
    fotoKTPC!.dispose();
    alamatC!.dispose();
    super.dispose();
  }
}
