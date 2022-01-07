import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends/controllers/friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'friend_list_item.dart';

class FriendList extends GetView<FriendsController> {
  const FriendList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
          itemCount: state!.length,
          padding: EdgeInsets.symmetric(vertical: 200),
          itemBuilder: (_, index) {
            return FriendListItem(
              dataFriend: state[index],
            );
          }),
      onLoading: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Palette.dixie),
        ),
      ),
      onEmpty: Center(
        child: Text('Friends are Empty'.tr,
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
