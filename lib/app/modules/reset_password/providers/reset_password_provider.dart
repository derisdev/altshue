import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/reset_password/models/reset_password.dart';
import 'package:get/get.dart';

class ResetPasswordProvider extends GetConnect {
  Future<ResetPassword> resetPassword({required Map dataResetPassword}) async {
    final response = await post(ApiPath.password, dataResetPassword);
    print(response.body);
    return ResetPassword.fromJson(response.body);
  }
}
