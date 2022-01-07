import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/modules/otp_password/controllers/otp_password_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FormOTPPassword extends GetView<OtpPasswordController> {
  const FormOTPPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: 50.0,
            right: 50,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ListView(
          children: [
            SizedBox(
              height: 70,
            ),
            Image.asset(AssetName.shoes, height: 75),
            SizedBox(
              height: 44,
            ),
            Text('MASUKKAN KODE OTP'.toUpperCase().tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Palette.white,
                    fontSize: 20,
                    fontFamily: AppFontStyle.montserratBold)),
            SizedBox(
              height: 40,
            ),
            Text(
                'Masukkan 4 Digit kode OTP yang telah\ndikirimkan via Email / SMS'
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 2,
                    color: Palette.white,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed)),
            SizedBox(height: 28),
            PinCodeTextField(
              autoDisposeControllers: false,
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 4,
              obscureText: false,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                // if (v!.length < 4) 0
                //   return "I'm from validator";
                // } else {
                //   return null;
                // }
              },

              pinTheme: PinTheme(
                fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8),
                shape: PinCodeFieldShape.box,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 70,
                fieldWidth: 57,
                activeFillColor: Palette.white,
                inactiveFillColor: Palette.white,
                selectedColor: Palette.doveGray,
                selectedFillColor: Palette.white,
                inactiveColor: Palette.doveGray,
                activeColor: Palette.doveGray,
              ),
              cursorColor: Palette.dixie,
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              autoDismissKeyboard: true,
              // errorAnimationController: controller.errorController,
              controller: controller.otpC,
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.center,
              boxShadows: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                print("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                if (value.length == 4) {
                  controller.otpValue.value = true;
                } else {
                  controller.otpValue.value = false;
                }
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
            SizedBox(height: 28),
            Obx(
              () => ButtonGlobal(
                onTap: controller.isLoadingButton.value
                    ? () {}
                    : () => controller.send(),
                title: 'SEND'.tr,
                child: controller.isLoadingButton.value
                    ? SpinKitThreeBounce(
                        color: Colors.white,
                        size: 20.0,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum Punya Akun ?'.tr,
                    style: TextStyle(
                        color: Palette.white,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratReg)),
                SizedBox(width: 10),
                InkWell(
                  onTap: () => Get.toNamed(Routes.REGISTER),
                  child: Text('REGISTRASI SEKARANG'.tr,
                      style: TextStyle(
                          color: Palette.dixie,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
