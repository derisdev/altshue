import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';
import 'components/list_field_pw.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
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
                  title: 'Change Password'.tr,
                ),
                SizedBox(height: 30),
                ListFieldPW(
                  controller: controller,
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () => controller.save(),
                    radius: 8,
                    fontSize: 14,
                    title: 'SEND'.tr,
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
