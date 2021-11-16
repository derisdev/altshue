import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/modules/login/controllers/login_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Form(
          key: controller.formGlobalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetName.shoes, height: 75),
              SizedBox(
                height: 44,
              ),
              Text('LOGIN',
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
                      hintText: 'Email / Nomor Telepon'.tr,
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
                    child: Text('Email/password is required',
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
                      controller: controller.passwordC,
                      hintText: 'Password'.tr,
                      obscureText: true,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          controller.isErrorPassword.value = true;
                        } else {
                          controller.isErrorPassword.value = false;
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
                        Icons.lock,
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
                    child: Text('Password is required',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold)),
                  ),
                ),
              ),
              SizedBox(height: 29),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('Lupa Password ?'.tr,
                    style: TextStyle(
                        color: Palette.white,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratReg)),
              ),
              SizedBox(height: 29),
              ButtonGlobal(
                onTap: () => controller.masuk(),
                title: 'MASUK'.tr,
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
