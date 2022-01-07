import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends/models/friend_req.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class FriendAddProvider extends GetConnect {
  Future<Friend> friendFind({required String keyword}) async {
    final response = await get(ApiPath.findFriend + '?term=$keyword');
    print(response.body);
    return Friend.fromJson(response.body);
  }

  Future<FriendConfirmDelete> friendAdd(
      {required String requestedMemberId}) async {
    final response = await post(
        ApiPath.friendReq, {'requested_member_id': requestedMemberId},
        headers: headerApi());
    print(response.body);
    return FriendConfirmDelete.fromJson(response.body);
  }
}
