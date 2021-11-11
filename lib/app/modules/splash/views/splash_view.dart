import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/constants/asset_path.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.checkToken();
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            AssetName.splashBg,
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetName.appIcon),
              SizedBox(
                height: 20,
              ),
              Text('Loading . . .'.tr,
                  style: TextStyle(
                      color: Palette.white,
                      fontSize: 14,
                      fontFamily: AppFontStyle.montserratBold)),
            ],
          ),
        )
      ],
    ));
  }
}
