import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonGlobal extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color primary;
  final Color textColor;
  final double radius;
  final double fontSize;
  final double? witdh;

  const ButtonGlobal(
      {Key? key,
      required this.onTap,
      required this.title,
      this.witdh,
      this.primary = Palette.dixie,
      this.textColor = Palette.white,
      this.radius = 5,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: witdh ?? Get.width,
      height: 46,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: primary,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        child: Text(title,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: AppFontStyle.montserratBold)),
      ),
    );
  }
}

class ButtonGlobalNoChild extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color primary;
  final Color textColor;
  final double radius;
  final Widget child;

  const ButtonGlobalNoChild(
      {Key? key,
      required this.onTap,
      required this.title,
      this.primary = Palette.dixie,
      this.textColor = Palette.white,
      this.radius = 8,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 35,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              primary: primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          child: child),
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

class ButtonDialogKTPVerif extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color primary;
  final Color textColor;
  final double bottomLeftRad;
  final double bottomRightRad;
  final double fontSize;

  const ButtonDialogKTPVerif(
      {Key? key,
      required this.onTap,
      required this.title,
      this.primary = Palette.dixie,
      this.textColor = Palette.white,
      this.fontSize = 14,
      required this.bottomLeftRad,
      required this.bottomRightRad})
      : super(key: key);

  factory ButtonDialogKTPVerif.nantisaja() {
    return ButtonDialogKTPVerif(
      bottomLeftRad: 20,
      bottomRightRad: 0,
      onTap: () => Get.back(),
      title: 'NANTI SAJA'.tr,
      textColor: Palette.silverChalice,
      primary: Palette.alto,
    );
  }
  factory ButtonDialogKTPVerif.verifikasi() {
    return ButtonDialogKTPVerif(
      bottomLeftRad: 0,
      bottomRightRad: 20,
      onTap: () => Get.toNamed(Routes.KTP_VERIF),
      title: 'VERIFIKASI'.tr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 46,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: primary,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(bottomLeftRad),
                    bottomRight: Radius.circular(bottomRightRad)))),
        child: Text(title,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: AppFontStyle.montserratBold)),
      ),
    );
  }
}
