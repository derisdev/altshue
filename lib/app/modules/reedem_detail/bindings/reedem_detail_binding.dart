import 'package:get/get.dart';

import '../controllers/reedem_detail_controller.dart';

class ReedemDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReedemDetailController>(
      () => ReedemDetailController(),
    );
  }
}
