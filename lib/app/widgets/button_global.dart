import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonGlobal extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ButtonGlobal({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 46,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: Palette.dixie,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(title,
            style: TextStyle(
                color: Palette.white,
                fontSize: 16,
                fontFamily: AppFontStyle.montserratBold)),
      ),
    );
  }
}

class ButtonLewati extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ButtonLewati({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 46,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            side: BorderSide(color: Palette.white)),
        child: Text(title,
            style: TextStyle(
                color: Palette.white,
                fontSize: 16,
                fontFamily: AppFontStyle.montserratBold)),
      ),
    );
  }
}

class ButtonUpload extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const ButtonUpload({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 29,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: Palette.silver,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(title,
            style: TextStyle(
                color: Palette.white,
                fontSize: 9,
                fontFamily: AppFontStyle.montserratBold)),
      ),
    );
  }
}
