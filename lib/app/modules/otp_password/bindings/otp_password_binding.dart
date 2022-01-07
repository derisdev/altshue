import 'package:get/get.dart';

import '../controllers/otp_password_controller.dart';

class OtpPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpPasswordController>(
      () => OtpPasswordController(),
    );
  }
}
