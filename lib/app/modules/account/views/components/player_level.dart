import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class LevelPlayer extends StatelessWidget {
  const LevelPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Level',
                    style: TextStyle(
                        color: Palette.tundora,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratBold)),
                SizedBox(height: 4.5),
                Image.asset(
                  AssetName.prodigious,
                  height: 40,
                ),
                SizedBox(height: 4),
                Text('Prodigious',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 10,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            ),
            Column(
              children: [
                Text('Exp : 1000 / 1000',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratMed)),
                SizedBox(height: 10.5),
                SizedBox(
                  width: 158,
                  child: LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: 1,
                    backgroundColor: Palette.dixie.withOpacity(0.25),
                    progressColor: Palette.dixie,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 30),
                FaIcon(FontAwesomeIcons.infinity,
                    size: 28, color: Palette.dixie),
                SizedBox(height: 9.5),
                Text('Max Level',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 10,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            )
          ],
        ));
  }
}
