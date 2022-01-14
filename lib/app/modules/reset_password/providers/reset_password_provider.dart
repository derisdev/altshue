import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/reset_password/models/reset_password.dart';
import 'package:http/http.dart' as http;

class ResetPasswordProvider {
  Future<ResetPassword> resetPassword({required Map dataResetPassword}) async {
    var url = Uri.parse(ApiPath.resetNewPassword);
    var response = await http.post(url, body: dataResetPassword);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return ResetPassword.fromJson(json.decode(response.body));
  }
}
