import 'package:altshue/app/modules/otp_password/providers/otp_password_provider.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OtpPasswordController extends GetxController {
  final otpC = TextEditingController();

  final isLoadingButton = false.obs;
  final otpValue = false.obs;

  final arg = Get.arguments;

  void send() {
    if (otpC.text.length == 4) {
      isLoadingButton.value = true;

      OTPPasswordProvider()
          .oTPPassword(email: arg['email'], otp: otpC.text)
          .then((response) {
        isLoadingButton.value = false;

        if (response.status == 200) {
          Get.offNamed(Routes.RESET_PASSWORD,
              arguments: {'member_id': response.data.MemberId});
        } else {
          showToasts(text: response.message);
        }
      });
    }
  }
}
