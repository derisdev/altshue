import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/friends_add/models/friend_add.dart';
import 'package:altshue/app/modules/friends_add/models/friend_find.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class FriendAddProvider extends GetConnect {
  Future<FriendFind> friendFind({String keyword = ''}) async {
    final response = await get(ApiPath.findFriend + '?term=$keyword');
    print(response.body);
    return FriendFind.fromJson(response.body);
  }

  Future<FriendAdd> riendAdd({required String requestedMemberId}) async {
    final response = await post(
        ApiPath.friendReq, {'requested_member_id': requestedMemberId},
        headers: headerApi());
    print(response.body);
    return FriendAdd.fromJson(response.body);
  }
}
