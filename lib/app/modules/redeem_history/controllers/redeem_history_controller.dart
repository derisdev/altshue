import 'package:altshue/app/modules/redeem_history/models/redeem_history.dart';
import 'package:altshue/app/modules/redeem_history/providers/redeem_history_provider.dart';
import 'package:get/get.dart';

class RedeemHistoryController extends GetxController
    with StateMixin<List<DataHistory>> {
  void getRedeemHistory() {
    RedeemHistoryProvider().redeemHistory().then((response) {
      if (response.status == 200) {
        if (response.data.isNotEmpty) {
          change(response.data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error(response.message));
      }
    });
  }

  @override
  void onInit() {
    getRedeemHistory();
    super.onInit();
  }
}
