import 'package:altshue/app/modules/account/controllers/account_controller.dart';
import 'package:altshue/app/modules/edit_profile/providers/edit_profile_provider.dart';
import 'package:altshue/app/utils/ui/dialog_ktp_unverif.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final TextEditingController? fullNameC = TextEditingController();
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? phoneC = TextEditingController();

  final defaultImage = ''.obs;

  final isErrorFullName = false.obs;
  final isErrorEmail = false.obs;
  final isErrorPhone = false.obs;
  final imagePath = ''.obs;

  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  initDataUser() {
    final arg = Get.arguments;
    fullNameC!.text = arg['full_name'];
    emailC!.text = arg['email'];
    phoneC!.text = arg['phone'];
    defaultImage.value = arg['foto'];

    print('def ${arg['foto']}');
  }

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
      if (imagePath.isNotEmpty || defaultImage.value.isNotEmpty) {
        isLoadingButton.value = true;

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
            Get.find<AccountController>().getAccount();
            Get.back();
            showToasts(text: response.message);
          } else {
            showToasts(text: response.message);
          }
        });
      } else {
        showToasts(text: 'Pilih foto terlebih dahulu');
      }
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
  void onInit() {
    initDataUser();
    Future.delayed(Duration(seconds: 1), () => initDialogKTPUnverif());
    super.onInit();
  }

  @override
  void dispose() {
    fullNameC!.dispose();
    phoneC!.dispose();
    emailC!.dispose();
    super.dispose();
  }
}
