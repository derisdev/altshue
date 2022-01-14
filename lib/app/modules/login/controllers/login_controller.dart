import 'package:altshue/app/modules/login/providers/login_provider.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? passwordC = TextEditingController();

  final isErrorEmail = false.obs;
  final isErrorPassword = false.obs;

  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  void masuk() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorEmail.value &&
        !isErrorPassword.value) {
      isLoadingButton.value = true;
      Map dataLogin = {
        'email': emailC!.text,
        'password': passwordC!.text,
      };
      print(dataLogin);
      LoginProvider().login(dataLogin: dataLogin).then((response) {
        isLoadingButton.value = false;

        if (response.status == 200) {
          print('token:: ${response.data!.token}');
          saveToken(response.data!.token);
          if (!response.data!.ektpVerified) {
            saveKtpVerified(false);
            Get.offAllNamed(Routes.KTP_VERIF);
          } else {
            Get.offAllNamed(Routes.HOME);
          }
        } else {
          showToasts(text: response.message);
        }
      });
    }
  }

  @override
  void dispose() {
    emailC!.dispose();
    passwordC!.dispose();
    super.dispose();
  }
}
