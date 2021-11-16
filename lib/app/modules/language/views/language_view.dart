import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';
import 'components/language_list.dart';

class LanguageView extends GetView<LanguageController> {
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
                  title: 'Language'.tr,
                ),
                SizedBox(height: 20),
                ListLanguage(
                  controller: controller,
                ),
                SizedBox(height: 108),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () => controller.changeLanguage(),
                    radius: 8,
                    fontSize: 14,
                    title: 'SAVE'.tr,
                  ),
                ),
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
