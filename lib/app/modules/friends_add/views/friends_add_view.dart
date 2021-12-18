import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/friends_add_controller.dart';
import 'components/list_people.dart';

class FriendsAddView extends GetView<FriendsAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            PeopleList(),
            Column(
              children: [
                SizedBox(
                  height: 88,
                ),
                Container(
                    height: 103,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    color: Palette.white,
                    child: Stack(
                      children: [
                        SearchField(
                          controller: controller.searchC,
                          hintText: 'Cari..'.tr,
                        ),
                        Positioned(
                          bottom: 40,
                          right: 0,
                          child: SizedBox(
                            width: 100,
                            child: ButtonGlobalNoChild(
                              onTap: () {},
                              title: 'SEARCH'.tr,
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  Text('SEARCH'.tr,
                                      style: TextStyle(
                                          color: Palette.white,
                                          fontSize: 10,
                                          fontFamily:
                                              AppFontStyle.montserratBold)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            HeaderBar(
              title: 'Add Friends'.tr,
            ),
            NavigationBar(
              index: 0,
            )
          ],
        ));
  }
}
