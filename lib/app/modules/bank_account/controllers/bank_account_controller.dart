import 'package:altshue/app/modules/bank_account/providers/bank_account_provider.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BankAccountController extends GetxController {
  final TextEditingController? numberPWC = TextEditingController();
  final TextEditingController? namePWC = TextEditingController();

  final isErrorBank = false.obs;
  final isErrorNumber = false.obs;
  final isErrorName = false.obs;
  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  void submit() {
    if (filterSelectedSorting.value == 'Choose Bank') {
      isErrorBank.value = true;
    } else {
      isErrorBank.value = false;
    }
    if (formGlobalKey.currentState!.validate() &&
        !isErrorNumber.value &&
        !isErrorName.value &&
        filterSelectedSorting.value != 'Choose Bank') {
      isLoadingButton.value = true;

      Map dataBank = {
        'BankName': filterSelectedSorting.value,
        'BankAccountName': namePWC!.text,
        'BankAccountNumber': numberPWC!.text,
      };
      BankAccountProvider()
          .bankAccount(
        dataBank: dataBank,
      )
          .then((response) {
        isLoadingButton.value = false;
        if (response.status == 200) {
          showToasts(text: 'Pengajuan Redeem Berhasil!');
          Get.offNamed(Routes.REDEEM_HISTORY);
        } else {
          showToasts(text: response.message);
        }
      });
    }
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
