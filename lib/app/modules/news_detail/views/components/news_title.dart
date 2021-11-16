import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 105,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetName.titleBg))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Area dengan Jaringan 5G di Indonesia',
              style: TextStyle(
                  color: Palette.white,
                  fontSize: 20,
                  fontFamily: AppFontStyle.montserratBold),
            ),
            SizedBox(height: 5),
            Text(
              '22 Oct 2021',
              style: TextStyle(
                  color: Palette.amber,
                  fontSize: 14,
                  fontFamily: AppFontStyle.montserratReg),
            ),
          ],
        ));
  }
}
