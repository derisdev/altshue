import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/otp_password/models/otp_password.dart';
import 'package:get/get.dart';

class OTPPasswordProvider extends GetConnect {
  Future<OTPPassword> oTPPassword({
    required String email,
    required String pin,
  }) async {
    final response =
        await post(ApiPath.confirmPassword, {'email': email, 'pin': pin});
    print(response.body);
    return OTPPassword.fromJson(response.body);
  }
}
