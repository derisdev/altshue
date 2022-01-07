import 'package:altshue/app/modules/lupa_password/providers/lupa_password_provider.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LupaPasswordController extends GetxController {
  final TextEditingController? emailC = TextEditingController();

  final isErrorEmail = false.obs;

  final formGlobalKey = GlobalKey<FormState>();
  final isLoadingButton = false.obs;

  void send() {
    if (formGlobalKey.currentState!.validate() && !isErrorEmail.value) {
      isLoadingButton.value = true;

      LupaPasswordProvider().lupaPassword(email: emailC!.text).then((response) {
        isLoadingButton.value = false;

        if (response.status == 200) {
          Get.offNamed(Routes.OTP_PASSWORD, arguments: {'email': emailC!.text});
        } else {
          showToasts(text: response.message);
        }
      });
    }
  }

  @override
  void dispose() {
    emailC!.dispose();
    super.dispose();
  }
}
