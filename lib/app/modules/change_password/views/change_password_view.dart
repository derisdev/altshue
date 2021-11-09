import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

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
                  title: 'Change Password',
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
                    title: 'SEND',
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

class ListFieldPW extends StatelessWidget {
  const ListFieldPW({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ChangePasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            CleanField(
              controller: controller.oldPWC,
              hintText: 'Old Password',
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorOld.value = true;
                } else {
                  controller.isErrorOld.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorOld.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Old Password is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CleanField(
              controller: controller.currentPWC,
              hintText: 'Current Password',
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorCurrent.value = true;
                } else {
                  controller.isErrorCurrent.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorCurrent.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Current Password is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CleanField(
              controller: controller.newPWC,
              hintText: 'New Password',
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorNew.value = true;
                } else {
                  controller.isErrorNew.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorNew.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('New Password is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CleanField(
              controller: controller.newConfirmPWC,
              hintText: 'Confirm New Password',
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorNewConfirm.value = true;
                } else {
                  controller.isErrorNewConfirm.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorNewConfirm.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Confirm New Password is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
