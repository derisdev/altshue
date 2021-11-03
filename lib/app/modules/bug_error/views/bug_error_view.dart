import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bug_error_controller.dart';

class BugErrorView extends GetView<BugErrorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: Column(
          children: [
            HeaderBar(
              title: 'Bug Error Report',
            ),
            SizedBox(height: 20),
            ListField(
              controller: controller,
            ),
            SizedBox(height: 108),
            SizedBox(
              width: 186,
              height: 41,
              child: ButtonGlobal(
                onTap: () => controller.report(),
                radius: 8,
                fontSize: 14,
                title: 'REPORT',
              ),
            ),
          ],
        ));
  }
}

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
            BugFieldItem(
              controller: controller.emailC,
              hintText: 'Enter your email address',
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
            BugFieldItem(
              controller: controller.descC,
              hintText: "Tell us what's wrong ?",
              icon: Icons.chat_bubble,
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

class UploadItem extends StatelessWidget {
  const UploadItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BugErrorController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BugFieldItem(
          controller: controller.imageC,
          hintText: "Upload Image",
          icon: Icons.image,
          isMultiline: true,
          readOnly: true,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              controller.isErrorImage.value = true;
            } else {
              controller.isErrorImage.value = false;
            }
            return null;
          },
        ),
        Positioned(
          right: 0,
          top: 7,
          bottom: 7,
          child: SizedBox(
              width: 90,
              child: ButtonGlobal(
                  onTap: () => controller.getImage(),
                  primary: Palette.silver,
                  title: 'UPLOAD',
                  fontSize: 12)),
        )
      ],
    );
  }
}

class BugFieldItem extends StatelessWidget {
  const BugFieldItem({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isMultiline = false,
    required this.validator,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final bool isMultiline;
  final bool readOnly;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OutlineField(
            controller: controller,
            hintText: hintText,
            isMultiline: isMultiline,
            validator: validator,
            readOnly: readOnly),
        Positioned(
            bottom: 0,
            top: 2,
            left: 0,
            child: Icon(icon, color: Palette.gray, size: 25)),
      ],
    );
  }
}
