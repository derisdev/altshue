import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class RankController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationC;
  final typeRank = 0.obs;
  double target = 0.0;

  void toGlobal() {
    typeRank.value = 0;
  }

  void toFriend() {
    typeRank.value = 1;
  }

  void onTapSort() {
    target += 0.50;
    if (target > 1.0) {
      target = 0.50;
      animationC.reset();
    }
    animationC.animateTo(target);
  }

  @override
  void onInit() {
    animationC = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    super.onInit();
  }

  @override
  void dispose() {
    animationC.dispose();
    super.dispose();
  }
}
