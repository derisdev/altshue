import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                HeaderBar(
                  title: 'About'.tr,
                ),
                SizedBox(height: 60),
                Image.asset(AssetName.about, height: 86),
                SizedBox(height: 54),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, right: 50, bottom: 24),
                  child: Text(
                    'About Desc'.tr,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Palette.mineShaft,
                        height: 1.5,
                        fontSize: 15,
                        fontFamily: AppFontStyle.robotoReg),
                  ),
                )
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
