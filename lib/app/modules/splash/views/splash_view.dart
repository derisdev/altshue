import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.checkToken();
    return Scaffold(
        backgroundColor: Palette.black,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading . . .',
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
