import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/lupa_password/models/lupa_password.dart';
import 'package:get/get.dart';

class LupaPasswordProvider extends GetConnect {
  Future<LupaPassword> lupaPassword({required String email}) async {
    final response = await post(ApiPath.resetPassword, {'email': email});
    print(response.body);
    return LupaPassword.fromJson(response.body);
  }
}
