import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LupaPasswordController extends GetxController {
  final TextEditingController? emailC = TextEditingController();

  final isErrorEmail = false.obs;

  final formGlobalKey = GlobalKey<FormState>();

  void masuk() {
    if (formGlobalKey.currentState!.validate() && !isErrorEmail.value) {
      Get.offAllNamed(Routes.RESET_PASSWORD);
    }
  }

  @override
  void dispose() {
    emailC!.dispose();
    super.dispose();
  }
}
