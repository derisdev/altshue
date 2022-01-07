import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends/controllers/friends_req_controller.dart';
import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

class FriendRequestItem extends GetView<FriendsReqController> {
  const FriendRequestItem(
    this.index, {
    Key? key,
    required this.dataFriend,
  }) : super(key: key);
  final DataFriend dataFriend;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      child: Container(
          padding: EdgeInsets.only(left: 19, top: 27, bottom: 27),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://cdn.iconscout.com/icon/free/png-256/avatar-373-456325.png')),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 2,
                        child: Text('John Doe',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 16,
                                fontFamily: AppFontStyle.montserratBold)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Online Time'.tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Palette.doveGray,
                                fontSize: 13,
                                fontFamily: AppFontStyle.montserratMed),
                          ),
                          Text(
                            ' : 08.00 - 10.00',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Palette.doveGray,
                                fontSize: 13,
                                fontFamily: AppFontStyle.montserratMed),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AssetName.prodigious,
                            height: 20,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Prodigious',
                            style: TextStyle(
                                color: Palette.doveGray,
                                fontSize: 13,
                                fontFamily: AppFontStyle.montserratMed),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 125,
                    height: 35,
                    child: Obx(
                      () => ButtonGlobal(
                        onTap: controller.isLoadingConfirm.value &&
                                controller.selectedIndex.value == index
                            ? () {}
                            : () => controller.confirmReq(
                                uniqueId: dataFriend.Id, index: index),
                        title: 'Confirm'.tr,
                        radius: 8,
                        child: controller.isLoadingConfirm.value
                            ? SpinKitThreeBounce(
                                color: Colors.white,
                                size: 20.0,
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  SizedBox(
                      width: 125,
                      height: 35,
                      child: Obx(
                        () => ButtonGlobal(
                          onTap: controller.isLoadingDelete.value &&
                                  controller.selectedIndex.value == index
                              ? () {}
                              : () => controller.deleteReq(
                                  uniqueId: dataFriend.Id, index: index),
                          title: 'Delete'.tr,
                          radius: 8,
                          primary: Palette.gallery,
                          textColor: Palette.darkTan,
                          child: controller.isLoadingConfirm.value
                              ? SpinKitThreeBounce(
                                  color: Palette.darkTan,
                                  size: 20.0,
                                )
                              : null,
                        ),
                      )),
                ],
              )
            ],
          )),
    );
  }
}
