import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class TodayActivity extends StatelessWidget {
  const TodayActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 13),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Today Activity'.tr,
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 12,
                  fontFamily: AppFontStyle.montserratBold)),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AssetName.expandArrowAlt,
                          color: Palette.silverChalice, height: 12.2),
                      Icon(Icons.timelapse,
                          color: Palette.silverChalice, size: 20),
                      SvgPicture.asset(AssetName.shoesIcon,
                          color: Palette.silverChalice, height: 24.2),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('3',
                                style: TextStyle(
                                    color: Palette.darkTan,
                                    fontSize: 28,
                                    fontFamily:
                                        AppFontStyle.montserratBoldItalic)),
                            SizedBox(
                              width: 4,
                            ),
                            Text('km',
                                style: TextStyle(
                                    color: Palette.darkTan,
                                    fontSize: 12,
                                    fontFamily:
                                        AppFontStyle.montserratBoldItalic)),
                          ],
                        ),
                        Text('DISTANCE'.tr,
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 8,
                                fontFamily: AppFontStyle.montserratMed)),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('5',
                                style: TextStyle(
                                    color: Palette.darkTan,
                                    fontSize: 28,
                                    fontFamily:
                                        AppFontStyle.montserratBoldItalic)),
                            SizedBox(
                              width: 4,
                            ),
                            Text('min',
                                style: TextStyle(
                                    color: Palette.darkTan,
                                    fontSize: 12,
                                    fontFamily:
                                        AppFontStyle.montserratBoldItalic)),
                          ],
                        ),
                        Text('HOURS'.tr,
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 8,
                                fontFamily: AppFontStyle.montserratMed)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('500',
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 28,
                                fontFamily: AppFontStyle.montserratBoldItalic)),
                        Text('STEPS'.tr,
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 8,
                                fontFamily: AppFontStyle.montserratMed)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
