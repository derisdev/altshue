import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/register/models/register.dart';
import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  Future<Register> register({required Map dataRegister}) async {
    final response = await post(
      ApiPath.register,
      dataRegister,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    return Register.fromJson(response.body);
  }
}
