import 'package:get/get.dart';

import '../controllers/mission_controller.dart';

class MissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MissionController>(
      () => MissionController(),
    );
  }
}
