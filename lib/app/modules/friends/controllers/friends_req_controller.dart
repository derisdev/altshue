import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends/models/friend_req.dart';
import 'package:altshue/app/modules/friends/providers/friend_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:get/get.dart';

class FriendsReqController extends GetxController
    with StateMixin<List<DataFriendReq>> {
  final lengthReq = 0.obs;

  void getFriendReq() {
    FriendProvider().friendReqList().then((response) {
      if (response.status == 200) {
        lengthReq.value = response.data.length;
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

  final selectedIndex = 0.obs;

  final isLoadingConfirm = false.obs;

  void confirmReq({required int index, required String uniqueId}) {
    selectedIndex.value = index;
    isLoadingConfirm.value = true;
    FriendProvider().friendConfirm(uniqueId: uniqueId).then((response) {
      isLoadingConfirm.value = false;

      if (response.status == 200) {
        getFriendReq();
        showToasts(text: response.message);
      } else {
        showToasts(text: response.message);
      }
    });
  }

  final isLoadingDelete = false.obs;

  void deleteReq({required int index, required String uniqueId}) {
    selectedIndex.value = index;
    isLoadingDelete.value = true;
    FriendProvider().friendDelete(uniqueId: uniqueId).then((response) {
      isLoadingDelete.value = false;

      if (response.status == 200) {
        getFriendReq();
        showToasts(text: response.message);
      } else {
        showToasts(text: response.message);
      }
    });
  }
}
