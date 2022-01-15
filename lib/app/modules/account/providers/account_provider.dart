import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/account/models/account.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class AccountProvider extends GetConnect {
  Future<Account> account() async {
    final response = await get(ApiPath.memberData, headers: headerApi());
    print(response.body);
    return Account.fromJson(response.body);
  }
}
