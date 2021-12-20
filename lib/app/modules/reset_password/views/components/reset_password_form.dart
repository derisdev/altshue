import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/modules/reset_password/controllers/reset_password_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormResetPassword extends GetView<ResetPasswordController> {
  const FormResetPassword({
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
        child: Form(
          key: controller.formGlobalKey,
          child: ListView(
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset(AssetName.shoes, height: 75),
              SizedBox(
                height: 44,
              ),
              Text('RESET PASSWORD'.toUpperCase().tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Palette.white,
                      fontSize: 20,
                      fontFamily: AppFontStyle.montserratBold)),
              SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 48,
                    child: InputField(
                      controller: controller.passwordC,
                      hintText: 'Masukkan Password Baru'.tr,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          controller.isErrorPW.value = true;
                        } else {
                          controller.isErrorPW.value = false;
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 5,
                      left: 19,
                      child: Icon(
                        Icons.email,
                        size: 20,
                        color: Palette.darkTan,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Visibility(
                  visible: controller.isErrorPW.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Password is required',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 48,
                    child: InputField(
                      controller: controller.passwordConfirmC,
                      hintText: 'Konfirmasi Password Baru'.tr,
                      isEmail: true,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          controller.isErrorPWC.value = true;
                        } else {
                          controller.isErrorPWC.value = false;
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 5,
                      left: 19,
                      child: Icon(
                        Icons.email,
                        size: 20,
                        color: Palette.darkTan,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Visibility(
                  visible: controller.isErrorPWC.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Password Confirm is required',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold)),
                  ),
                ),
              ),
              SizedBox(height: 29),
              ButtonGlobal(
                onTap: () => controller.masuk(),
                title: 'RESET'.tr,
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
      ),
    );
  }
}
