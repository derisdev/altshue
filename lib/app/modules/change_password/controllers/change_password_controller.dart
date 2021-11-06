import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/utils/helpers/dialog_password.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController? oldPWC = TextEditingController();
  final TextEditingController? currentPWC = TextEditingController();
  final TextEditingController? newPWC = TextEditingController();
  final TextEditingController? newConfirmPWC = TextEditingController();

  final isErrorOld = false.obs;
  final isErrorCurrent = false.obs;
  final isErrorNew = false.obs;
  final isErrorNewConfirm = false.obs;
  final formGlobalKey = GlobalKey<FormState>();

  void save() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorOld.value &&
        !isErrorCurrent.value &&
        !isErrorNew.value &&
        !isErrorNewConfirm.value) {
      if (newPWC!.text == newConfirmPWC!.text) {
        showDialogPW(
            icon: Icons.verified_user,
            onTap: () {
              Get.back();
              Get.back();
            },
            text: "Password changed successfully",
            textButton: 'GO BACK',
            isDismissible: false);
      } else {
        showDialogPW(
            icon: Icons.warning_rounded,
            onTap: () => Get.back(),
            text: "Password doesn't match",
            textButton: 'RETRY');
      }
    }
  }

  @override
  void dispose() {
    oldPWC!.dispose();
    currentPWC!.dispose();
    newPWC!.dispose();
    newConfirmPWC!.dispose();
    super.dispose();
  }
}
