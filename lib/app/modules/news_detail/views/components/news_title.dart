import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/utils/helpers/data_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleNews extends StatelessWidget {
  final String title;
  final String date;

  const TitleNews({Key? key, required this.title, required this.date})
      : super(key: key);

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
            SizedBox(
              height: 50,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Palette.white,
                    fontSize: 20,
                    fontFamily: AppFontStyle.montserratBold),
              ),
            ),
            SizedBox(height: 5),
            Text(
              dateFormat(date),
              style: TextStyle(
                  color: Palette.amber,
                  fontSize: 14,
                  fontFamily: AppFontStyle.montserratReg),
            ),
          ],
        ));
  }
}
