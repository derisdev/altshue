import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Persentase extends StatelessWidget {
  const Persentase(
      {Key? key,
      required this.icon,
      required this.percent,
      required this.progress,
      required this.progressValue})
      : super(key: key);

  final String icon;
  final double percent;
  final String progressValue;
  final String progress;

  factory Persentase.km() {
    return Persentase(
      icon: AssetName.expandArrowAlt,
      percent: 3 / 5,
      progress: 'Kilometers'.tr,
      progressValue: '3/5 ',
    );
  }
  factory Persentase.min() {
    return Persentase(
      icon: AssetName.timelapse,
      percent: 1 / 2,
      progress: 'Minutes'.tr,
      progressValue: '5/10 ',
    );
  }
  factory Persentase.step() {
    return Persentase(
      icon: AssetName.shoesIcon,
      percent: 7 / 10,
      progress: 'Steps'.tr,
      progressValue: '700/1000 ',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.5),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: Palette.darkTan,
            height: icon == AssetName.shoesIcon ? 15 : 10,
          ),
          SizedBox(
            width: 10.7,
          ),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              width: Get.width / 2.2,
              percent: percent,
              backgroundColor: Palette.thunderbird.withOpacity(0.25),
              progressColor: Palette.thunderbird,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Row(
            children: [
              Text(progressValue,
                  style: TextStyle(
                      color: Palette.tundora,
                      fontSize: 10,
                      fontFamily: AppFontStyle.montserratMed)),
              Text(progress,
                  style: TextStyle(
                      color: Palette.tundora,
                      fontSize: 10,
                      fontFamily: AppFontStyle.montserratMed)),
            ],
          )
        ],
      ),
    );
  }
}
