import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:altshue/app/modules/friends/models/friend_req.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FriendProvider extends GetConnect {
  Future<Friend> friend() async {
    final response = await get(ApiPath.listFriend, headers: headerApi());
    print(response.body);
    return Friend.fromJson(response.body);
  }

  Future<FriendReq> friendReqList() async {
    final response = await get(ApiPath.friendReqList, headers: headerApi());
    print('friend req ${response.body}');
    return FriendReq.fromJson(response.body);
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

  Future<FriendConfirmDelete> friendFollow(
      {required String followedMemberId}) async {
    var url = Uri.parse(ApiPath.friendReq);
    var response = await http.post(url,
        body: {'followed_member_id': followedMemberId}, headers: headerApi());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return FriendConfirmDelete.fromJson(json.decode(response.body));
  }
}
