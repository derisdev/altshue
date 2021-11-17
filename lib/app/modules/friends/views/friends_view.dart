import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/friends_controller.dart';
import 'components/friend_list.dart';
import 'components/friend_request.dart';

class FriendsView extends GetView<FriendsController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Palette.alabaster,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              flexibleSpace: Image(
                image: AssetImage(AssetName.headerBg),
                fit: BoxFit.cover,
              ),
              backgroundColor: Palette.darkTan,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: Palette.dixie,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text('Friend List'.tr,
                          style: TextStyle(
                              color: Palette.white,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratMed)),
                      alignment: Alignment.center,
                      height: 23,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Palette.white),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                      icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Friend Request'.tr,
                          style: TextStyle(
                              color: Palette.white,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratMed)),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Palette.dixie, shape: BoxShape.circle),
                        child: Text('1',
                            style: TextStyle(
                                color: Palette.white,
                                fontSize: 10,
                                fontFamily: AppFontStyle.montserratMed)),
                      )
                    ],
                  )),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Friends'.tr,
                    style: TextStyle(
                        color: Palette.white,
                        fontSize: 17,
                        fontFamily: AppFontStyle.montserratMed)),
              ),
              actions: [
                IconButton(
                    onPressed: () => Get.toNamed(Routes.FRIENDS_ADD),
                    icon: Icon(
                      Icons.person_add,
                      color: Palette.white,
                      size: 30,
                    )),
                SizedBox(
                  width: 15,
                )
              ]),
          body: Stack(
            children: [
              TabBarView(
                children: [FriendList(), FriendRequest()],
              ),
              NavigationBar(
                index: 0,
              )
            ],
          )),
    );
  }
}
