import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CurrentRank extends StatelessWidget {
  const CurrentRank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(top: 26, left: 20, right: 31, bottom: 29),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetName.prodigious,
              height: 68,
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Adinda',
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 16,
                                fontFamily: AppFontStyle.montserratBold)),
                        SizedBox(height: 5),
                        Container(
                          width: 61,
                          height: 21,
                          decoration: BoxDecoration(
                              color: Palette.darkTan,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text('No.70',
                                style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 11,
                                    fontFamily: AppFontStyle.montserratBold)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 155,
                  child: LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: 1,
                    backgroundColor: Palette.dixie.withOpacity(0.25),
                    progressColor: Palette.dixie,
                  ),
                ),
                SizedBox(height: 14),
                Text('Exp : 1000 / 1000',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 11,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            ),
            Column(
              children: [
                FaIcon(FontAwesomeIcons.infinity,
                    size: 40, color: Palette.dixie),
                SizedBox(height: 9.5),
                Text('Max Level'.tr,
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 11,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            )
          ],
        ));
  }
}
