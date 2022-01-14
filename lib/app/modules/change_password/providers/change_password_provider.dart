import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/change_password/models/change_password.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordProvider extends GetConnect {
  Future<ChangePassword> changePassword({required Map dataPassword}) async {
    var url = Uri.parse(ApiPath.updatePassword);
    var response =
        await http.post(url, body: dataPassword, headers: headerApi());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return ChangePassword.fromJson(json.decode(response.body));
  }
}
