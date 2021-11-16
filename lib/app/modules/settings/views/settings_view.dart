import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import 'components/setting_list.dart';

class SettingsView extends GetView<SettingsController> {
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
                  title: 'Settings'.tr,
                ),
                SizedBox(height: 20),
                ListSetting(),
                SizedBox(height: 30),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () {},
                    primary: Palette.darkTan,
                    radius: 8,
                    fontSize: 14,
                    title: 'LOGOUT'.tr,
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
