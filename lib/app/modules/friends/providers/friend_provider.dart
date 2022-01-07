import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends/models/friend_confirm.dart';
import 'package:altshue/app/modules/friends/models/friend_delete.dart';
import 'package:altshue/app/modules/friends/models/friend_req.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class FriendProvider extends GetConnect {
  Future<Friend> friend() async {
    final response = await get(ApiPath.listFriend, headers: headerApi());
    print(response.body);
    return Friend.fromJson(response.body);
  }

  Future<FriendReq> friendReqList() async {
    final response = await get(ApiPath.friendReq, headers: headerApi());
    print(response.body);
    return FriendReq.fromJson(response.body);
  }

  Future<FriendConfirm> friendConfirm({required String uniqueId}) async {
    final response = await get(ApiPath.confirmReq + '?unique_id=$uniqueId');
    print(response.body);
    return FriendConfirm.fromJson(response.body);
  }

  Future<FriendDelete> friendDelete({required String uniqueId}) async {
    final response = await get(ApiPath.unfriend + '?unique_id=$uniqueId');
    print(response.body);
    return FriendDelete.fromJson(response.body);
  }
}
