import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? passwordC = TextEditingController();

  final isErrorEmail = false.obs;
  final isErrorPassword = false.obs;

  final formGlobalKey = GlobalKey<FormState>();

  void masuk() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorEmail.value &&
        !isErrorPassword.value) {
      Get.offAllNamed(Routes.KTP_VERIF);
    }
  }

  @override
  void dispose() {
    emailC!.dispose();
    passwordC!.dispose();
    super.dispose();
  }
}
