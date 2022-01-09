import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/account/controllers/account_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class ReedemPoint extends StatelessWidget {
  const ReedemPoint({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(top: 14, left: 21, right: 18, bottom: 14),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Row(
          children: [
            Image.asset(AssetName.ap, height: 31),
            SizedBox(width: 15),
            Text('400',
                style: TextStyle(
                    color: Palette.darkTan,
                    fontSize: 25,
                    fontFamily: AppFontStyle.montserratBold)),
            SizedBox(width: 6),
            Text('A.P',
                style: TextStyle(
                    color: Palette.darkTan,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratBold)),
            Spacer(),
            Stack(
              children: [
                Container(
                    width: 103,
                    height: 29,
                    decoration: BoxDecoration(
                        color: Palette.dixie,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.gift,
                                size: 15, color: Palette.white),
                            SizedBox(width: 9.3),
                            Text('REDEEM'.tr,
                                style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 10,
                                    fontFamily: AppFontStyle.montserratBold)),
                          ]),
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.REEDEM),
                      child: SizedBox(
                        width: 103,
                        height: 29,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
