import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/login/models/login.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Login> login({required Map dataLogin}) async {
    print('data login:: $dataLogin');
    final response = await post(
      ApiPath.login,
      dataLogin,
    );
    print(response.statusCode);
    print(response.body);
    return Login.fromJson(response.body);
  }
}
