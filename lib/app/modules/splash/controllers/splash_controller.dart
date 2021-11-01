import 'package:altshue/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void checkToken() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed(Routes.LOGIN);
    });
  }
}
