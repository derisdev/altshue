import 'package:altshue/app/modules/mission/providers/mission_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
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
  final visibleMission = true.obs;

  void changeHeight() {
    visible.value = !visible.value;
  }

  void changeHeightMission() {
    visibleMission.value = !visibleMission.value;
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

  //api
  // void getListMission({String missionType = 'daily'}) {
  //   //1=daily 2=weekly 3=monthly 4=yearly. kalau kosong=all
  //   MissionProvider().listMission(missionType: missionType).then((response) {
  //     if (response.status == 200) {
  //       //tampilkan
  //     } else {
  //       showToasts(text: response.message);
  //     }
  //   });
  // }

  void checkMission({required String missionId}) {
    //mission id dari list mission
    MissionProvider().checkMission(missionId: missionId).then((response) {
      if (response.status == 200) {
        //tampilkan
      } else {
        showToasts(text: response.message);
      }
    });
  }

  // void checkAchievmentMission({String title = 'step'}) {
  //   //step,hour,login,mission,gift
  //   MissionProvider().checkAchievmentMission(title: title).then((response) {
  //     if (response.status == 200) {
  //       //tampilkan
  //     } else {
  //       showToasts(text: response.message);
  //     }
  //   });
  // }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    super.dispose();
  }
}
