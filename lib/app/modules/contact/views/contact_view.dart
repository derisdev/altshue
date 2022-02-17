import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: controller.obx(
                  (state) => ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 100),
                      ContactDetail(
                        adress: state!.Address,
                        email: state.Email,
                        phone: state.Phone,
                      ),
                      SizedBox(height: 53),
                      ListFieldContact(
                        controller: controller,
                      ),
                      SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: SizedBox(
                          width: 186,
                          height: 41,
                          child: Obx(
                            () => ButtonGlobal(
                              onTap: () => controller.isLoadingButton.value
                                  ? () {}
                                  : controller.send(),
                              radius: 8,
                              fontSize: 14,
                              title: 'SEND'.tr,
                              child: controller.isLoadingButton.value
                                  ? SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 20.0,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      FollowUs(),
                      SizedBox(height: 150),
                    ],
                  ),
                  onLoading: SizedBox(
                    height: Get.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Palette.dixie),
                      ),
                    ),
                  ),
                  onEmpty: SizedBox(
                    height: Get.height,
                    child: Center(
                      child: Text('Contact are Empty'.tr,
                          style: TextStyle(
                              color: Palette.black,
                              fontSize: 13,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                  ),
                  onError: (error) => SizedBox(
                    height: Get.height,
                    child: Center(
                      child: Text(error.toString(),
                          style: TextStyle(
                              color: Palette.black,
                              fontSize: 13,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                  ),
                )),
            HeaderBar(
              title: 'Contact'.tr,
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
