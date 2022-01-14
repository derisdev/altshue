import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/register/models/register.dart';
import 'package:http/http.dart' as http;

class RegisterProvider {
  Future<Register> register({required Map dataRegister}) async {
    var url = Uri.parse(ApiPath.register);
    var response = await http.post(url, body: dataRegister);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return Register.fromJson(json.decode(response.body));
  }
}
