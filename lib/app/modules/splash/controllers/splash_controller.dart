import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void checkToken() {
    Future.delayed(Duration(seconds: 2), () {
      String? token = getToken();
      print(token);
      // eraseDataActivity();
      if (token != null) {
        if (getKtpVerified() != null) {
          if (getKtpVerified()!) {
            Get.offNamed(Routes.HOME);
          } else {
            Get.offNamed(Routes.KTP_VERIF);
          }
        } else {
          Get.offNamed(Routes.KTP_VERIF);
        }
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }
}
