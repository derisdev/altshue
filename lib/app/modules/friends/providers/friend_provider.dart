import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends/models/friend_req.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class FriendProvider extends GetConnect {
  Future<Friend> friend() async {
    final response = await get(ApiPath.listFriend, headers: headerApi());
    print(response.body);
    return Friend.fromJson(response.body);
  }

  Future<Friend> friendReqList() async {
    final response = await get(ApiPath.friendReqList, headers: headerApi());
    print('friend req ${response.body}');
    return Friend.fromJson(response.body);
  }

  Future<FriendConfirmDelete> friendConfirm({required String uniqueId}) async {
    final response = await get(ApiPath.confirmReq + '?unique_id=$uniqueId');
    print(response.body);
    return FriendConfirmDelete.fromJson(response.body);
  }

  Future<FriendConfirmDelete> friendDelete({required String uniqueId}) async {
    final response = await get(ApiPath.unfriend + '?unique_id=$uniqueId');
    print(response.body);
    return FriendConfirmDelete.fromJson(response.body);
  }
}
