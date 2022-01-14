import 'package:altshue/app/modules/register/providers/register_provider.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
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

  final isLoadingButton = false.obs;

  void register() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrornama.value &&
        !isErrorEmail.value &&
        !isErrorNoTelp.value &&
        !isErrorPassword.value &&
        !isErrorUlangiPassword.value) {
      if (passwordC!.text == ulangiPasswordC!.text) {
        isLoadingButton.value = true;
        Map dataRegister = {
          'Email': emailC!.text,
          'Phone': notelpC!.text,
          'Fullname': namaC!.text,
          'Password': passwordC!.text,
        };

        print(dataRegister);
        RegisterProvider()
            .register(dataRegister: dataRegister)
            .then((response) {
          isLoadingButton.value = false;
          if (response.status == 200) {
            saveToken(response.data!.Token);
            print(getToken());
            Get.offAllNamed(Routes.KTP_VERIF);
          } else {
            showToasts(text: response.message);
          }
        });
      } else {
        showToasts(text: 'Password tidak sama');
      }
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
