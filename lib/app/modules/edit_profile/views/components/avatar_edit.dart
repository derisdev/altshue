import 'dart:io';

import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AvatarEdit extends StatelessWidget {
  const AvatarEdit({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.getImage(),
      child: CircleAvatar(
        radius: 40,
        child: Stack(
          children: [
            Obx(
              () => controller.imagePath.isNotEmpty
                  ? CircleAvatar(
                      radius: 40,
                      backgroundColor: Palette.merkury,
                      backgroundImage:
                          FileImage(File(controller.imagePath.value)))
                  : CircleAvatar(radius: 40, backgroundColor: Palette.merkury),
            ),
            Positioned(
                bottom: 5,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Palette.darkTan,
                  child: Icon(Icons.edit, color: Palette.white, size: 12),
                )),
          ],
        ),
      ),
    );
  }
}
