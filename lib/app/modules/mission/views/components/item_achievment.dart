import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/mission/views/components/text_and_diamond.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AchievmentItem extends StatelessWidget {
  const AchievmentItem({
    Key? key,
    required this.mainIconType,
    required this.iconList,
    required this.title,
    required this.percent,
  }) : super(key: key);

  final String title;
  final String mainIconType;
  final List<String> iconList;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextAndDiamond(
          icon: mainIconType,
          text: title.tr,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                LinearPercentIndicator(
                  lineHeight: 8.0,
                  width: 77,
                  percent: percent,
                  backgroundColor: percent != 1
                      ? Palette.thunderbird.withOpacity(0.25)
                      : Palette.dixie.withOpacity(0.25),
                  progressColor:
                      percent != 1 ? Palette.thunderbird : Palette.dixie,
                ),
                SizedBox(
                  width: 2,
                ),
                FaIcon(FontAwesomeIcons.infinity,
                    color: Palette.dixie, size: 13)
              ],
            ),
            SizedBox(
              height: 8.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                width: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: percent >= 0.2,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Image.asset(iconList[0], height: 13)),
                    Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: percent >= 0.4,
                        child: Image.asset(iconList[1], height: 13)),
                    Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: percent >= 0.6,
                        child: Image.asset(iconList[2], height: 13)),
                    Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: percent >= 0.8,
                        child: Image.asset(iconList[3], height: 13)),
                    Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: percent == 1,
                        child: Image.asset(iconList[4], height: 13)),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
