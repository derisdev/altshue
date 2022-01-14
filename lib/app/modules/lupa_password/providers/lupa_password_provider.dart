import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/lupa_password/models/lupa_password.dart';
import 'package:http/http.dart' as http;

class LupaPasswordProvider {
  Future<LupaPassword> lupaPassword({required String email}) async {
    var url = Uri.parse(ApiPath.lupaPassword);
    var response = await http.post(url, body: {'email': email});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return LupaPassword.fromJson(json.decode(response.body));
  }
}
