import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
class ReedemButton extends StatelessWidget {
  const ReedemButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              width: 186,
              height: 41,
              decoration: BoxDecoration(
                  color: Palette.dixie, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(FontAwesomeIcons.gift, size: 17, color: Palette.white),
                  SizedBox(width: 12),
                  Text('REDEEM',
                      style: TextStyle(
                          color: Palette.white,
                          fontSize: 14,
                          fontFamily: AppFontStyle.montserratBold)),
                ]),
              )),
          SizedBox(
            width: 186,
            height: 41,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.BANK_ACCOUNT),
                  child: SizedBox(
                    width: 96,
                    height: 29,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
