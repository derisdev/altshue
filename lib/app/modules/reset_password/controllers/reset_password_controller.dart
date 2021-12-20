import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController? passwordC = TextEditingController();
  final TextEditingController? passwordConfirmC = TextEditingController();

  final isErrorPW = false.obs;
  final isErrorPWC = false.obs;

  final formGlobalKey = GlobalKey<FormState>();

  void masuk() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorPW.value &&
        !isErrorPWC.value) {}
  }

  @override
  void dispose() {
    passwordC!.dispose();
    passwordConfirmC!.dispose();
    super.dispose();
  }
}
