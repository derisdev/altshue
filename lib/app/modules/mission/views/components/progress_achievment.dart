import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/mission/controllers/mission_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import 'item_achievment.dart';

class AchievmentProgress extends StatelessWidget {
  const AchievmentProgress({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MissionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Achievment Progress'.tr,
                        style: TextStyle(
                            color: Palette.tundora,
                            fontSize: 12,
                            fontFamily: AppFontStyle.montserratBold)),
                    InkWell(
                        onTap: () => controller.changeHeight(),
                        child: Obx(
                          () => RotationTransition(
                              turns: !controller.visible.value
                                  ? controller.animation2
                                  : controller.animation1,
                              child: FaIcon(FontAwesomeIcons.chevronDown,
                                  size: 15)),
                        )),
                  ],
                ),
              ),
              AnimatedSize(
                duration: Duration(milliseconds: 300),
                child: SizedBox(
                  height: controller.visible.value ? null : 0.0,
                  child: Column(
                    children: [
                      Divider(
                        color: Palette.alto,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Row(
                          children: [
                            AchievmentItem(
                              iconList: [
                                AssetName.stepBronze,
                                AssetName.stepSilver,
                                AssetName.stepGold,
                                AssetName.stepPlatinum,
                                AssetName.stepDiamond
                              ],
                              mainIconType: AssetName.stepDiamond,
                              title: 'Steps',
                              percent: 1,
                            ),
                            Spacer(),
                            AchievmentItem(
                              iconList: [
                                AssetName.weeklyBronze,
                                AssetName.weeklySilver,
                                AssetName.weeklyGold,
                                AssetName.weeklyPlatinum,
                                AssetName.weeklyDiamond
                              ],
                              mainIconType: AssetName.weeklyDiamond,
                              title: 'Weekly',
                              percent: 0.8,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Row(
                          children: [
                            AchievmentItem(
                              iconList: [
                                AssetName.hourBronze,
                                AssetName.hourSilver,
                                AssetName.hourGold,
                                AssetName.hourPlatinum,
                                AssetName.hourDiamond
                              ],
                              mainIconType: AssetName.hourDiamond,
                              title: 'Hour',
                              percent: 0.8,
                            ),
                            Spacer(),
                            AchievmentItem(
                              iconList: [
                                AssetName.friendsBronze,
                                AssetName.friendsSilver,
                                AssetName.friendsGold,
                                AssetName.friendsPlatinum,
                                AssetName.friendsDiamond
                              ],
                              mainIconType: AssetName.friendsDiamond,
                              title: 'Friends',
                              percent: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: AchievmentItem(
                          iconList: [
                            AssetName.loginBronze,
                            AssetName.loginSilver,
                            AssetName.loginGold,
                            AssetName.loginPlatinum,
                            AssetName.loginDiamond
                          ],
                          mainIconType: AssetName.loginDiamond,
                          title: 'Login',
                          percent: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
