import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends_add/controllers/friends_add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_people_item.dart';

class PeopleList extends GetView<FriendsAddController> {
  const PeopleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
          itemCount: state!.length,
          padding: EdgeInsets.symmetric(vertical: 200),
          itemBuilder: (_, index) {
            return PeopleListItem(
              index: index,
              dataFriend: state[index],
            );
          }),
      onLoading: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Palette.dixie),
        ),
      ),
      onEmpty: Center(
        child: Text('Data not Found'.tr,
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
