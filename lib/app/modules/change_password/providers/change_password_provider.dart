import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/change_password/models/change_password.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class ChangePasswordProvider extends GetConnect {
  Future<ChangePassword> changePassword({required Map dataPassword}) async {
    final response =
        await post(ApiPath.password, dataPassword, headers: headerApi());
    print(response.body);
    return ChangePassword.fromJson(response.body);
  }
}
