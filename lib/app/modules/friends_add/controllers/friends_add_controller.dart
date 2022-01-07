import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends_add/providers/friend_add_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FriendsAddController extends GetxController
    with StateMixin<List<DataFriend>> {
  TextEditingController searchC = TextEditingController();
  final txtSearch = ''.obs;

  void findFriend({String keyword = ''}) {
    change(null, status: RxStatus.loading());
    FriendAddProvider().friendFind(keyword: keyword).then((response) {
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

  void addFriend({required String requestedMemberId}) {
    FriendAddProvider()
        .friendAdd(requestedMemberId: requestedMemberId)
        .then((response) {
      if (response.status == 200) {
        findFriend();
        showToasts(text: response.message);
      } else {
        showToasts(text: response.message);
      }
    });
  }

  @override
  void onInit() {
    findFriend();

    debounce(txtSearch, (_) {
      findFriend(keyword: txtSearch.value);
    }, time: Duration(seconds: 1));
    super.onInit();
  }

  @override
  void dispose() {
    searchC.dispose();
    super.dispose();
  }
}
