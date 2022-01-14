import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void logout() {
    clearStorage();
    Get.offAllNamed(Routes.SPLASH);
  }
}
