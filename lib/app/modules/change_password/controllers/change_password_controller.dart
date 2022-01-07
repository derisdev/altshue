import 'package:altshue/app/modules/change_password/providers/change_password_provider.dart';
import 'package:altshue/app/utils/ui/dialog_password.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/material.dart';
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

  final isLoadingButton = false.obs;

  void save() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorOld.value &&
        !isErrorCurrent.value &&
        !isErrorNew.value &&
        !isErrorNewConfirm.value) {
      if (newPWC!.text == newConfirmPWC!.text) {
        isLoadingButton.value = true;
        Map dataPassword = {
          'Old_Password': oldPWC!.text,
          'Current_Password': currentPWC!.text,
          'Password': newPWC!.text,
          'Password_Again': newConfirmPWC!.text,
        };
        ChangePasswordProvider()
            .changePassword(dataPassword: dataPassword)
            .then((response) {
          isLoadingButton.value = false;

          if (response.status == 200) {
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
            showToasts(text: response.message);
          }
        });
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
