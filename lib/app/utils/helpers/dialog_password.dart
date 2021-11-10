import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void showDialogPW(
    {required IconData icon,
    required String text,
    required String textButton,
    required VoidCallback onTap,
    bool isDismissible = true}) {
  Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 190,
          width: Get.width,
          padding: EdgeInsets.only(top: 23, bottom: 21),
          decoration: BoxDecoration(
              color: Palette.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              isDismissible
                  ? SvgPicture.asset(
                      AssetName.alertTriangle,
                    )
                  : Icon(
                      icon,
                      size: 50,
                      color: Palette.chateauGreen,
                    ),
              SizedBox(
                height: 15,
              ),
              Text(text,
                  style: TextStyle(
                      color: Palette.darkTan,
                      fontSize: 16,
                      fontFamily: AppFontStyle.montserratBold)),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 186,
                height: 41,
                child: ButtonGlobal(
                  onTap: onTap,
                  radius: 8,
                  fontSize: 14,
                  title: textButton,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: isDismissible);
}
