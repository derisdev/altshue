import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ListFieldEditProfile extends StatelessWidget {
  const ListFieldEditProfile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            CleanField(
              controller: controller.fullNameC,
              hintText: 'Nama Lengkap'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorFullName.value = true;
                } else {
                  controller.isErrorFullName.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorFullName.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Full Name is required',
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
              controller: controller.emailC,
              hintText: 'Email'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorEmail.value = true;
                } else {
                  controller.isErrorEmail.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorEmail.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email is required',
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
              controller: controller.phoneC,
              hintText: 'Nomor Telepon'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorPhone.value = true;
                } else {
                  controller.isErrorPhone.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorPhone.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone is required',
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
