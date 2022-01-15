import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/otp_password/models/otp_password.dart';
import 'package:http/http.dart' as http;

class OTPPasswordProvider {
  Future<OTPPassword> oTPPassword({
    required String email,
    required String otp,
  }) async {
    var url = Uri.parse(ApiPath.otpVerify);
    var response = await http.post(url, body: {'email': email, 'otp': otp});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return OTPPassword.fromJson(json.decode(response.body));
  }
}
