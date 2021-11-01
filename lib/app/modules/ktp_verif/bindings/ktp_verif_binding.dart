import 'package:get/get.dart';

import '../controllers/ktp_verif_controller.dart';

class KtpVerifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KtpVerifController>(
      () => KtpVerifController(),
    );
  }
}
