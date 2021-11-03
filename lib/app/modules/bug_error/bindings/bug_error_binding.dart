import 'package:get/get.dart';

import '../controllers/bug_error_controller.dart';

class BugErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BugErrorController>(
      () => BugErrorController(),
    );
  }
}
