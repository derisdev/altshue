import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/home/views/components/persentase_mission.dart';
import 'package:altshue/app/modules/mission/controllers/mission_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class MissionDaily extends GetView<MissionController> {
  const MissionDaily({
    Key? key,
  }) : super(key: key);

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
              Text('Mission'.tr,
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
                      onTap: () => controller.changeHeightMission(),
                      child: Obx(
                        () => RotationTransition(
                            turns: !controller.visibleMission.value
                                ? controller.animation2
                                : controller.animation1,
                            child:
                                FaIcon(FontAwesomeIcons.chevronDown, size: 15)),
                      )),
                ],
              ),
            ],
          ),
          Obx(
            () => Visibility(
              visible: controller.visibleMission.value,
              child: Column(
                children: [
                  SizedBox(
                    height: 9,
                  ),
                  Divider(
                    color: Palette.alto,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.visibleMission.value,
              child: ListView.builder(
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
                                Text('A.P : 100 Exp : 100',
                                    style: TextStyle(
                                        color: Palette.dixie,
                                        fontSize: 10,
                                        fontFamily:
                                            AppFontStyle.montserratBold)),
                                SizedBox(
                                  width: 20,
                                ),
                                index == 1
                                    ? SvgPicture.asset(
                                        AssetName.checkSquare,
                                        height: 20,
                                      )
                                    : Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                color: Palette.silver,
                                                width: 2)),
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
                  }),
            ),
          )
        ],
      ),
    );
  }
}
