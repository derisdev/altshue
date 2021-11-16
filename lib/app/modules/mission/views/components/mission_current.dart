import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/mission/views/components/text_and_diamond.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          icon: AssetName.stepDiamond,
          text: 'Steps'.tr,
        ),
        TextAndDiamond(
          icon: AssetName.hourDiamond,
          text: 'Hours'.tr,
        ),
        TextAndDiamond(
          icon: AssetName.loginDiamond,
          text: 'Login',
        ),
        TextAndDiamond(
          icon: AssetName.weeklyDiamond,
          text: 'Weekly'.tr,
        ),
        TextAndDiamond(
          icon: AssetName.friendsDiamond,
          text: 'Friends'.tr,
        ),
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
        Image.asset(
          AssetName.prodigious,
          height: 120,
        ),
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
