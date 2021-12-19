import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mission_controller.dart';
import 'components/daily_mission.dart';
import 'components/mission_current.dart';
import 'components/progress_achievment.dart';

class MissionView extends GetView<MissionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(bottom: 150, top: 90),
              children: [
                CurrentMission(),
                SizedBox(height: 11),
                AchievmentProgress(),
                SizedBox(height: 11),
                MissionDaily(),
              ],
            ),
            HeaderMainBar(
              title: 'Mission'.tr,
            ),
            NavigationBar(
              index: 1,
            )
          ],
        ));
  }
}
