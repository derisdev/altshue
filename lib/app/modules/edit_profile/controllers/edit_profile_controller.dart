import 'package:altshue/app/utils/helpers/dialog_ktp_unverif.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final TextEditingController? fullNameC = TextEditingController();
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? phoneC = TextEditingController();

  final isErrorFullName = false.obs;
  final isErrorEmail = false.obs;
  final isErrorPhone = false.obs;
  final imagePath = ''.obs;

  final formGlobalKey = GlobalKey<FormState>();

  void save() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorFullName.value &&
        !isErrorEmail.value &&
        !isErrorPhone.value) {
      showDialogKTPUnverif(
          icon: Icons.warning_rounded,
          onTap: () {
            Get.back();
          },
          text: "Segera Verifikasi KTP Anda".tr,
          isDismissible: false);
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
}
