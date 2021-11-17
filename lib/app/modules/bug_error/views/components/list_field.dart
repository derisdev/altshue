import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/bug_error/controllers/bug_error_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'bug_or_contact_item.dart';
import 'item_upload.dart';

class ListField extends StatelessWidget {
  const ListField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BugErrorController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            BugOrContactFieldItem(
              controller: controller.emailC,
              hintText: 'Enter your email address'.tr,
              icon: Icons.email,
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
                visible: controller.isErrorDesc.value,
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
              height: 15.6,
            ),
            BugOrContactFieldItem(
              controller: controller.descC,
              hintText: "Tell us what's wrong ?".tr,
              icon: Icons.chat_bubble,
              isSVG: true,
              isMultiline: true,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorDesc.value = true;
                } else {
                  controller.isErrorDesc.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorDesc.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Deskripsi is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            UploadItem(controller: controller),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorImage.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Image is required',
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
