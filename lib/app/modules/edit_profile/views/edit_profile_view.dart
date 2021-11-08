import 'dart:io';

import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        body: Column(
          children: [
            HeaderBar(
              title: 'Edit Profile',
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      color: Palette.white,
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          StatusVerifKTP(),
                          SizedBox(height: 30),
                          AvatarEdit(
                            controller: controller,
                          ),
                          SizedBox(height: 10),
                          ListFieldEditProfile(
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
                              title: 'SAVE',
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

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

class StatusVerifKTP extends StatelessWidget {
  const StatusVerifKTP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Status :',
                  style: TextStyle(
                      color: Palette.silverChalice,
                      fontSize: 10,
                      fontFamily: AppFontStyle.montserratMed)),
              SizedBox(height: 5),
              Text('Belum Verifikasi KTP',
                  style: TextStyle(
                      color: Palette.silverChalice,
                      fontSize: 12,
                      fontFamily: AppFontStyle.montserratBold)),
            ],
          ),
          SizedBox(
            width: 100,
            height: 29,
            child: ButtonGlobal(
              onTap: () {},
              radius: 5,
              fontSize: 10,
              primary: Palette.darkTan,
              title: 'ISI DATA KTP',
            ),
          ),
        ],
      ),
    );
  }
}

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
              hintText: 'Full Name',
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
              hintText: 'Email',
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
              hintText: 'Phone',
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
