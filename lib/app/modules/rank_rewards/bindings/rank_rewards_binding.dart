import 'package:get/get.dart';

import '../controllers/rank_rewards_controller.dart';

class RankRewardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankRewardsController>(
      () => RankRewardsController(),
    );
  }
}
