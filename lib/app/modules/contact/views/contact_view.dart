import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';
import 'components/contact_detail.dart';
import 'components/contact_list_field.dart';
import 'components/follow_us.dart';

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
                  title: 'Contact'.tr,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 60),
                      ContactDetail(),
                      SizedBox(height: 53),
                      ListFieldContact(
                        controller: controller,
                      ),
                      SizedBox(height: 53),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: SizedBox(
                          width: 186,
                          height: 41,
                          child: ButtonGlobal(
                            onTap: () => controller.send(),
                            radius: 8,
                            fontSize: 14,
                            title: 'SEND'.tr,
                          ),
                        ),
                      ),
                      SizedBox(height: 53),
                      FollowUs(),
                      SizedBox(height: 150),
                    ],
                  ),
                )
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
