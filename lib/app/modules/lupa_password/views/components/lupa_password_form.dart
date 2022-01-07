import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/modules/lupa_password/controllers/lupa_password_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class FormLupaPassword extends GetView<LupaPasswordController> {
  const FormLupaPassword({
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
              Text('LUPA PASSWORD'.toUpperCase().tr,
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
                      controller: controller.emailC,
                      hintText: 'Masukkan email yang terdaftar'.tr,
                      isEmail: true,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          controller.isErrorEmail.value = true;
                        } else {
                          controller.isErrorEmail.value = false;
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
                  visible: controller.isErrorEmail.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email is required',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold)),
                  ),
                ),
              ),
              SizedBox(height: 29),
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
      ),
    );
  }
}
