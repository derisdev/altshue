import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetName.headerBg,
              ),
              fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.only(left: 22, top: 30),
        child: Row(
          children: [
            InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: Palette.white,
                )),
            SizedBox(
              width: 10,
            ),
            Text(title,
                style: TextStyle(
                    color: Palette.white,
                    fontSize: 17,
                    fontFamily: AppFontStyle.montserratMed)),
          ],
        ),
      ),
    );
  }
}
