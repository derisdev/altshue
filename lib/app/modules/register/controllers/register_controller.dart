import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController? namaC = TextEditingController();
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? notelpC = TextEditingController();
  final TextEditingController? passwordC = TextEditingController();
  final TextEditingController? ulangiPasswordC = TextEditingController();

  final isErrornama = false.obs;
  final isErrorEmail = false.obs;
  final isErrorNoTelp = false.obs;
  final isErrorPassword = false.obs;
  final isErrorUlangiPassword = false.obs;

  final formGlobalKey = GlobalKey<FormState>();

  void register() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrornama.value &&
        !isErrorEmail.value &&
        !isErrorNoTelp.value &&
        !isErrorPassword.value &&
        !isErrorUlangiPassword.value) {
      Get.offNamed(Routes.KTP_VERIF);
    }
  }

  @override
  void dispose() {
    namaC!.dispose();
    emailC!.dispose();
    notelpC!.dispose();
    passwordC!.dispose();
    ulangiPasswordC!.dispose();
    super.dispose();
  }
}
