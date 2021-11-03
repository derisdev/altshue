import 'package:get/get.dart';

import '../controllers/reedem_controller.dart';

class ReedemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReedemController>(
      () => ReedemController(),
    );
  }
}
