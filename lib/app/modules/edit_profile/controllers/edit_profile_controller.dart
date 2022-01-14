import 'package:altshue/app/modules/edit_profile/providers/edit_profile_provider.dart';
import 'package:altshue/app/utils/ui/dialog_ktp_unverif.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class EditProfileController extends GetxController {
  final TextEditingController? fullNameC = TextEditingController();
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? phoneC = TextEditingController();

  final isErrorFullName = false.obs;
  final isErrorEmail = false.obs;
  final isErrorPhone = false.obs;
  final imagePath = ''.obs;

  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  initDialogKTPUnverif() {
    showDialogKTPUnverif(
        icon: Icons.warning_rounded,
        onTap: () {
          Get.back();
        },
        text: "Segera Verifikasi KTP Anda".tr,
        isDismissible: false);
  }

  void save() async {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorFullName.value &&
        !isErrorEmail.value &&
        !isErrorPhone.value) {
      isLoadingButton.value = true;

      dio.FormData dataEditProfile = dio.FormData.fromMap({
        if (imagePath.value.isNotEmpty) ...{
          "Foto": await dio.MultipartFile.fromFile(
            imagePath.value,
            filename: imagePath.value.split('/').last,
          ),
        },
        'Email': emailC!.text,
        'Phone': phoneC!.text,
        'Fullname': fullNameC!.text,
      });

      EditProfileProvider()
          .editProfile(
        email: emailC!.text,
        filePath: imagePath.value,
        fullName: fullNameC!.text,
        phone: phoneC!.text,
      )
          .then((response) {
        isLoadingButton.value = false;

        if (response.status == 200) {
          Get.back();
          showToasts(text: response.message);
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
      print(imagePath.value);
    } else {
      imagePath.value = '';
    }
  }

  @override
  void dispose() {
    fullNameC!.dispose();
    phoneC!.dispose();
    emailC!.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 1), () => initDialogKTPUnverif());
    super.onInit();
  }
}
