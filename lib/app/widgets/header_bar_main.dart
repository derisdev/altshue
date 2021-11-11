import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderMainBar extends StatelessWidget {
  const HeaderMainBar({
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
        padding: const EdgeInsets.only(top: 44.0, left: 31),
        child: Text(title,
            style: TextStyle(
                color: Palette.white,
                fontSize: 17,
                fontFamily: AppFontStyle.montserratMed)),
      ),
    );
  }
}
