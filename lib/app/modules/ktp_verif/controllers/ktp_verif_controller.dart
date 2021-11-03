import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KtpVerifController extends GetxController {
  final TextEditingController? noKTPC = TextEditingController();
  final TextEditingController? fotoKTPC = TextEditingController();
  final TextEditingController? alamatC = TextEditingController();

  final isErrornoKTP = false.obs;
  final isErrorAlamat = false.obs;
  final isErrorFotoKTP = false.obs;
  final imagePath = ''.obs;
  final formGlobalKey = GlobalKey<FormState>();

  void submit() {
    if (imagePath.value.isNotEmpty) {
      isErrorFotoKTP.value = true;
    } else {
      isErrorFotoKTP.value = false;
    }
    if (formGlobalKey.currentState!.validate() &&
        !isErrornoKTP.value &&
        !isErrorAlamat.value &&
        imagePath.value.isNotEmpty) {
      Get.offNamed(Routes.HOME);
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
