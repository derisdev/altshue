import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:altshue/app/modules/bug_error/controllers/bug_error_controller.dart';

import 'bug_or_contact_item.dart';

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
        BugOrContactFieldItem(
          controller: controller.imageC,
          hintText: "Upload Image".tr,
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
