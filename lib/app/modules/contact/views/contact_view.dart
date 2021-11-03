import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/bug_error/views/bug_error_view.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: Column(
          children: [
            HeaderBar(
              title: 'Contact',
            ),
            SizedBox(height: 60),
            SizedBox(
              height: 100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.ac_unit, size: 80),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TileContact(
                            icon: Icons.email,
                            title: 'ask@altshue.com',
                          ),
                          TileContact(
                            icon: Icons.call,
                            title: '08123456789',
                          ),
                          TileContact(
                            icon: Icons.pin_drop,
                            title: 'Jl. Address Here',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 53),
            ListField(
              controller: controller,
            ),
            SizedBox(height: 53),
            SizedBox(
              width: 186,
              height: 41,
              child: ButtonGlobal(
                onTap: () => controller.send(),
                radius: 8,
                fontSize: 14,
                title: 'SEND',
              ),
            ),
          ],
        ));
  }
}

class TileContact extends StatelessWidget {
  const TileContact({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Palette.darkTan),
        SizedBox(
          width: 11.5,
        ),
        Text(
          title,
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 14,
              fontFamily: AppFontStyle.montserratReg),
        ),
      ],
    );
  }
}

class ListField extends StatelessWidget {
  const ListField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ContactController controller;

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
          ],
        ),
      ),
    );
  }
}
