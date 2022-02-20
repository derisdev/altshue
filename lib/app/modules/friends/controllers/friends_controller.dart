import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends/providers/friend_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'friends_req_controller.dart';

class FriendsController extends GetxController
    with StateMixin<List<DataFriend>> {
  PageController pageC = PageController();
  final selectedIndex = 0.obs;

  void getFriend() {
    FriendProvider().friend().then((response) {
      if (response.status == 200) {
        if (response.data.isNotEmpty) {
          change(response.data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error(response.message));
      }
    });
  }

  void friendFollow(
      {required String followedMemberId, required bool isFollowed}) {
    if (!isFollowed) {
      showToasts(text: 'Diikuti');
      FriendProvider()
          .friendFollow(followedMemberId: followedMemberId)
          .then((response) {
        if (response.status == 200) {
          getFriend();
        } else {}
      });
    } else {}
  }

  @override
  void onInit() {
    getFriend();
    Get.put(FriendsReqController()).getFriendReq();
    super.onInit();
  }

  @override
  void dispose() {
    pageC.dispose();
    super.dispose();
  }
}
