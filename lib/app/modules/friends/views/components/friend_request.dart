import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends/controllers/friends_req_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'friend_request_item.dart';

class FriendRequest extends GetView<FriendsReqController> {
  const FriendRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
          itemCount: state!.length,
          padding: EdgeInsets.only(top: 10, bottom: 150),
          itemBuilder: (_, index) {
            return FriendRequestItem(
              index,
              dataFriend: state[index],
            );
          }),
      onLoading: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Palette.dixie),
        ),
      ),
      onEmpty: Center(
        child: Text('Friend Request are Empty'.tr,
            style: TextStyle(
                color: Palette.black,
                fontSize: 13,
                fontFamily: AppFontStyle.montserratBold)),
      ),
      onError: (error) => Center(
        child: Text(error.toString(),
            style: TextStyle(
                color: Palette.black,
                fontSize: 13,
                fontFamily: AppFontStyle.montserratBold)),
      ),
    );
  }
}
