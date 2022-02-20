import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/friends/models/friend_req.dart';
import 'package:altshue/app/modules/friends_add/models/friend_find.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FriendAddProvider extends GetConnect {
  Future<FriendFind> friendFind({required String keyword}) async {
    final response = await get(ApiPath.findFriend + '?term=$keyword');
    print(response.body);
    return FriendFind.fromJson(response.body);
  }

  Future<FriendConfirmDelete> friendAdd(
      {required String requestedMemberId}) async {
    var url = Uri.parse(ApiPath.friendReq);
    var response = await http.post(url,
        body: {'requested_member_id': requestedMemberId}, headers: headerApi());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return FriendConfirmDelete.fromJson(json.decode(response.body));
  }
}
