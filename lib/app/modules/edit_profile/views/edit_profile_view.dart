import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';
import 'components/avatar_edit.dart';
import 'components/list_field_edit_profile.dart';
import 'components/status_ktp_verif.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                HeaderBar(
                  title: 'Edit Profile'.tr,
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
                                child: Obx(
                                  () => ButtonGlobal(
                                    onTap: controller.isLoadingButton.value
                                        ? () {}
                                        : () => controller.save(),
                                    radius: 8,
                                    fontSize: 14,
                                    title: 'SAVE'.tr,
                                    child: controller.isLoadingButton.value
                                        ? SpinKitThreeBounce(
                                            color: Colors.white,
                                            size: 20.0,
                                          )
                                        : null,
                                  ),
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
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
