import 'package:altshue/app/modules/account/models/account.dart';
import 'package:altshue/app/modules/account/providers/account_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';

class AccountController extends GetxController with StateMixin<DataAccount> {
  void copyRefferal() {
    FlutterClipboard.copy('J0HND03').then((value) {
      showToasts(text: 'Refferal Code Copied');
    });
  }

  void getAccount() {
    AccountProvider().account().then((response) {
      if (response.status == 200) {
        change(response.data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(response.message));
        // showToasts(text: 'text');
      }
    });
  }

  @override
  void onInit() {
    getAccount();
    super.onInit();
  }
}
