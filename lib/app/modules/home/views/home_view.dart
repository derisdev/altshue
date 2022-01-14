import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/home/views/home_bluetooth_view.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'components/activity_today.dart';
import 'components/home_mission.dart';
import 'components/home_news.dart';
import 'components/home_top.dart';
import 'components/progress_mission.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: () {
            return controller.onWillPop();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  TopHome(
                    controller: controller,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 30),
                        child: MissionProgress(),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !controller.isConnected.value,
                          child: Container(
                            color: Palette.black.withOpacity(0.7),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AssetName.pairText),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.toBluetoothList();
                                      },
                                      child: SvgPicture.asset(AssetName.pair)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
              Mission(),
              TodayActivity(),
              NavigationBar(
                index: 2,
              )
            ],
          ),
        ));
  }
}
