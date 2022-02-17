import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/redeem_history/models/redeem_history.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class RedeemHistoryProvider extends GetConnect {
  Future<RedeemHistory> redeemHistory() async {
    final response = await get(ApiPath.redeemHistory, headers: headerApi());
    print(response.statusCode);
    print(response.body);
    return RedeemHistory.fromJson(response.body);
  }
}
