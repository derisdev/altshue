import 'package:get/get.dart';

import '../controllers/friends_add_controller.dart';

class FriendsAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendsAddController>(
      () => FriendsAddController(),
    );
  }
}
