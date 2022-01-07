import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends/controllers/friends_req_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/friends_controller.dart';
import 'components/friend_list.dart';
import 'components/friend_request.dart';

class FriendsView extends GetView<FriendsController> {
  final friendReqC = Get.put(FriendsReqController());
  @override
  Widget build(BuildContext context) {
    final heightAppbar = 90.0;
    final heightTabbar = 61.0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Palette.alabaster,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: heightAppbar + heightTabbar),
                child: PageView(
                  controller: controller.pageC,
                  onPageChanged: (index) {
                    controller.selectedIndex.value = index;
                  },
                  children: [FriendList(), FriendRequest()],
                ),
              ),
              HeaderBar(
                title: 'Friends',
                haveBackButton: false,
                trailing: IconButton(
                    onPressed: () => Get.toNamed(Routes.FRIENDS_ADD),
                    icon: Icon(
                      Icons.person_add,
                      color: Palette.white,
                      size: 30,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: heightAppbar - 2),
                child: Column(
                  children: [
                    Divider(
                      color: Palette.white.withOpacity(0.3),
                      thickness: 0.5,
                      height: 0.1,
                    ),
                    Stack(
                      children: [
                        Container(
                            color: Palette.darkTan,
                            width: Get.width,
                            height: heightTabbar,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.pageC.animateToPage(0,
                                        curve: Curves.linear,
                                        duration: Duration(milliseconds: 300));
                                  },
                                  child: SizedBox(
                                    width: Get.width / 2 - 10,
                                    child: Center(
                                      child: Text('Friend List'.tr,
                                          style: TextStyle(
                                              color: Palette.white,
                                              fontSize: 12,
                                              fontFamily:
                                                  AppFontStyle.montserratMed)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      color: Palette.white,
                                      thickness: 1.5,
                                    )),
                                InkWell(
                                  onTap: () {
                                    controller.pageC.animateToPage(1,
                                        curve: Curves.linear,
                                        duration: Duration(milliseconds: 300));
                                  },
                                  child: SizedBox(
                                    width: Get.width / 2 - 10,
                                    child: Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Friend Request'.tr,
                                                style: TextStyle(
                                                    color: Palette.white,
                                                    fontSize: 12,
                                                    fontFamily: AppFontStyle
                                                        .montserratMed)),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Obx(
                                              () => Visibility(
                                                visible: friendReqC
                                                        .lengthReq.value !=
                                                    0,
                                                child: Container(
                                                  padding: EdgeInsets.all(7),
                                                  decoration: BoxDecoration(
                                                      color: Palette.dixie,
                                                      shape: BoxShape.circle),
                                                  child: Visibility(
                                                    visible: friendReqC
                                                            .lengthReq.value !=
                                                        0,
                                                    child: Text(
                                                        friendReqC
                                                            .lengthReq.value
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Palette.white,
                                                            fontSize: 10,
                                                            fontFamily: AppFontStyle
                                                                .montserratMed)),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Obx(() => Positioned(
                              bottom: 0,
                              right: controller.selectedIndex.value == 1
                                  ? 0
                                  : null,
                              left: controller.selectedIndex.value == 0
                                  ? 0
                                  : null,
                              child: Container(
                                width: Get.width / 2 + 2,
                                height: 2,
                                color: Palette.dixie,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              NavigationBar(
                index: 0,
              )
            ],
          )),
    );
  }
}
