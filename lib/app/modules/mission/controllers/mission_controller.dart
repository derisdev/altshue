import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:math';

class MissionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  final rotateTime = 1.obs;

  final visible = false.obs;

  void changeHeight() {
    visible.value = !visible.value;
  }

  @override
  void onInit() {
    animationController1 = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animationController2 = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation1 =
        Tween<double>(begin: 0, end: -pi / 12).animate(animationController1);
    animation2 =
        Tween<double>(begin: -pi / 12, end: 0).animate(animationController2);
    super.onInit();
  }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    super.dispose();
  }
}
