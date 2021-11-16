import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TitleRedeem extends StatelessWidget {
  const TitleRedeem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 105,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetName.titleBg))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 27),
            Text(
              'Gift 1',
              style: TextStyle(
                  color: Palette.white,
                  fontSize: 20,
                  fontFamily: AppFontStyle.montserratBold),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Palette.white,
                  child: Image.asset(AssetName.ap, height: 19),
                ),
                SizedBox(width: 7),
                Text(
                  '500 A.P',
                  style: TextStyle(
                      color: Palette.amber,
                      fontSize: 14,
                      fontFamily: AppFontStyle.montserratBold),
                ),
              ],
            )
          ],
        ));
  }
}
