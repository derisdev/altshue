import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/bug_error/views/bug_error_view.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
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
                  title: 'Contact',
                ),
                SizedBox(height: 60),
                ContactDetail(),
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
                Spacer(),
                FollowUs(),
                SizedBox(height: 150),
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}

class FollowUs extends StatelessWidget {
  const FollowUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          ],
        ),
        SizedBox(height: 6.3),
        Text(
          'Follow Our Social Media',
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 10,
              fontFamily: AppFontStyle.montserratReg),
        ),
        SizedBox(height: 6),
        Text(
          '@altshue',
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 10,
              fontFamily: AppFontStyle.montserratBold),
        ),
      ],
    );
  }
}

class ContactDetail extends StatelessWidget {
  const ContactDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetName.about, height: 86),
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
                    icon: Icons.place,
                    title: 'Jl. Address Here',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileContact extends StatelessWidget {
  const TileContact({
    Key? key,
    required this.title,
    required this.icon,
    this.isSVG = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isSVG;

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
            BugOrContactFieldItem(
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
            BugOrContactFieldItem(
              controller: controller.descC,
              hintText: "Any help ?",
              isSVG: true,
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
