// import 'package:altshue/app/constants/api_path.dart';
// import 'package:altshue/app/modules/login/models/login.dart';
// import 'package:get/get.dart';
import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/login/models/login.dart';
import 'package:http/http.dart' as http;

// class LoginProvider extends GetConnect {
//   Future<Login> login({required Map dataLogin}) async {
//     print('data login:: $dataLogin');
//     final response = await post(
//       ApiPath.login,
//       dataLogin,
//     );
//     print(response.statusCode);
//     print(response.body);
//     return Login.fromJson(response.body);
//   }
// }
class LoginProvider {
  Future<Login> login({required Map dataLogin}) async {
    print('data login:: $dataLogin');

    var url = Uri.parse(ApiPath.login);
    var response = await http.post(url, body: dataLogin);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return Login.fromJson(json.decode(response.body));
  }
}
