import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/home/views/home_view.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/mission_controller.dart';

class MissionView extends GetView<MissionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        body: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 60),
                CurrentMission(),
                SizedBox(height: 11),
                AchievmentProgress(
                  controller: controller,
                ),
                SizedBox(height: 11),
                MissionDaily(
                  controller: controller,
                ),
              ],
            ),
            HeaderMainBar(
              title: 'Mission',
            ),
          ],
        ));
  }
}

class AchievmentProgress extends StatelessWidget {
  const AchievmentProgress({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MissionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
          height: controller.animatedHeight.value,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 21),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          duration: const Duration(milliseconds: 120),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Achievment Progress',
                      style: TextStyle(
                          color: Palette.tundora,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratBold)),
                  InkWell(
                      onTap: () => controller.changeHeight(),
                      child: Obx(
                        () => RotationTransition(
                            turns: controller.rotateTime.value == 0
                                ? controller.animation2
                                : controller.animation1,
                            child:
                                FaIcon(FontAwesomeIcons.chevronDown, size: 15)),
                      )),
                ],
              ),
              Visibility(
                visible: controller.animatedHeight.value != 70,
                child: SizedBox(
                  height: 19,
                ),
              ),
              Visibility(
                visible: controller.animatedHeight.value != 70,
                child: Column(
                  children: [
                    Divider(
                      color: Palette.alto,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        AchievmentItem(),
                        Spacer(),
                        AchievmentItem(),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: [
                        AchievmentItem(),
                        Spacer(),
                        AchievmentItem(),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    AchievmentItem(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class AchievmentItem extends StatelessWidget {
  const AchievmentItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextAndDiamond(
          icon: Icons.ac_unit,
          text: 'Steps',
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                LinearPercentIndicator(
                  lineHeight: 8.0,
                  width: 79,
                  percent: 1,
                  backgroundColor: Palette.dixie.withOpacity(0.25),
                  progressColor: Palette.dixie,
                ),
                SizedBox(
                  width: 6,
                ),
                FaIcon(FontAwesomeIcons.infinity,
                    color: Palette.dixie, size: 15)
              ],
            ),
            SizedBox(
              height: 8.5,
            ),
            Row(
              children: [
                Icon(Icons.ac_unit, size: 15),
                Icon(Icons.ac_unit, size: 15),
                Icon(Icons.ac_unit, size: 15),
                Icon(Icons.ac_unit, size: 15),
                Icon(Icons.ac_unit, size: 15),
              ],
            )
          ],
        )
      ],
    );
  }
}

class MissionDaily extends StatelessWidget {
  const MissionDaily({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MissionController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 21),
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mission',
                  style: TextStyle(
                      color: Palette.tundora,
                      fontSize: 12,
                      fontFamily: AppFontStyle.montserratBold)),
              Row(
                children: [
                  Text('Daily',
                      style: TextStyle(
                          color: Palette.tundora,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratBold)),
                  SizedBox(
                    width: 9,
                  ),
                  InkWell(
                      onTap: () {},
                      child: FaIcon(FontAwesomeIcons.chevronDown, size: 15)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Divider(
            color: Palette.alto,
          ),
          SizedBox(
            height: 5,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (_, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mission 1',
                            style: TextStyle(
                                color: Palette.tundora,
                                fontSize: 12,
                                fontFamily: AppFontStyle.montserratBold)),
                        Row(
                          children: [
                            Text('Point : 100 Exp : 100',
                                style: TextStyle(
                                    color: Palette.dixie,
                                    fontSize: 10,
                                    fontFamily: AppFontStyle.montserratBold)),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: Palette.silver, width: 2)),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11.5,
                    ),
                    Persentase.km(),
                    SizedBox(
                      height: 12,
                    ),
                    Persentase.min(),
                    SizedBox(
                      height: 12,
                    ),
                    Persentase.step(),
                    SizedBox(
                      height: 16,
                    ),
                    index == 2
                        ? SizedBox()
                        : Divider(
                            color: Palette.alto,
                          )
                  ],
                );
              })
        ],
      ),
    );
  }
}

class CurrentMission extends StatelessWidget {
  const CurrentMission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: EdgeInsets.only(top: 26, left: 20, right: 31, bottom: 29),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Column(
          children: [
            TopColMission(),
            SizedBox(
              height: 12,
            ),
            BottomColMission(),
          ],
        ));
  }
}

class BottomColMission extends StatelessWidget {
  const BottomColMission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextAndDiamond(
          icon: Icons.ac_unit,
          text: 'Steps',
        ),
        TextAndDiamond(
          icon: Icons.ac_unit,
          text: 'Hour',
        ),
        TextAndDiamond(
          icon: Icons.ac_unit,
          text: 'Login',
        ),
        TextAndDiamond(
          icon: Icons.ac_unit,
          text: 'Weekly',
        ),
        TextAndDiamond(
          icon: Icons.ac_unit,
          text: 'Friends',
        ),
      ],
    );
  }
}

class TextAndDiamond extends StatelessWidget {
  const TextAndDiamond({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                color: Palette.doveGray,
                fontSize: 8,
                fontFamily: AppFontStyle.montserratBold)),
        SizedBox(
          height: 1,
        ),
        Icon(icon, size: 45),
      ],
    );
  }
}

class TopColMission extends StatelessWidget {
  const TopColMission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Text(
                  "EXP",
                  style: TextStyle(
                      inherit: true,
                      fontSize: 17.0,
                      color: Palette.darkTan,
                      fontFamily: AppFontStyle.montserratBold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-0.5, -0.5),
                            color: Palette.dixie),
                        Shadow(
                            // bottomRight
                            offset: Offset(0.5, -0.5),
                            color: Palette.dixie),
                        Shadow(
                            // topRight
                            offset: Offset(0.5, 0.5),
                            color: Palette.dixie),
                        Shadow(
                            // topLeft
                            offset: Offset(-0.5, 0.5),
                            color: Palette.dixie),
                      ]),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('1000',
                style: TextStyle(
                    color: Palette.darkTan,
                    fontSize: 29,
                    fontFamily: AppFontStyle.montserratBoldItalic)),
            SizedBox(
              height: 10,
            ),
            Text('Total Exp',
                style: TextStyle(
                    color: Palette.doveGray,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed)),
          ],
        ),
        Icon(Icons.ac_unit, size: 120),
        Column(
          children: [
            Image.asset(AssetName.ap, height: 22),
            SizedBox(
              height: 5,
            ),
            Text('400',
                style: TextStyle(
                    color: Palette.darkTan,
                    fontSize: 29,
                    fontFamily: AppFontStyle.montserratBoldItalic)),
            SizedBox(
              height: 10,
            ),
            Text('Total A.P',
                style: TextStyle(
                    color: Palette.doveGray,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed)),
          ],
        ),
      ],
    );
  }
}
