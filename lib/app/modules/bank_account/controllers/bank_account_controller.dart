import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BankAccountController extends GetxController {
  final TextEditingController? numberPWC = TextEditingController();
  final TextEditingController? namePWC = TextEditingController();

  final isErrorBank = false.obs;
  final isErrorNumber = false.obs;
  final isErrorName = false.obs;
  final formGlobalKey = GlobalKey<FormState>();

  void submit() {
    if (filterSelectedSorting.value == 'Choose Bank') {
      isErrorBank.value = true;
    } else {
      isErrorBank.value = false;
    }
    if (formGlobalKey.currentState!.validate() &&
        !isErrorNumber.value &&
        !isErrorName.value &&
        filterSelectedSorting.value != 'Choose Bank') {}
  }

  final filterSelectedSorting = 'Choose Bank'.obs;

  void changeFilterSorting(String newFilterSorting) {
    filterSelectedSorting.value = newFilterSorting;
  }

  @override
  void dispose() {
    numberPWC!.dispose();
    namePWC!.dispose();
    super.dispose();
  }
}
