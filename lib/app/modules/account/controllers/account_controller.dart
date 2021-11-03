import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  void copyRefferal() {
    FlutterClipboard.copy('J0HND03').then((value) {
      showToasts(text: 'Refferal Code Copied');
    });
  }
}
