import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/modules/ktp_verif/controllers/ktp_verif_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormKTPVerif extends StatelessWidget {
  const FormKTPVerif({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final KtpVerifController controller;

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
                height: 44,
              ),
              Image.asset(AssetName.shoes, height: 75),
              SizedBox(
                height: 44,
              ),
              Text('VERIFIKASI KTP'.tr,
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
                      controller: controller.noKTPC,
                      hintText: 'No. KTP'.tr,
                      isNumber: true,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          controller.isErrornoKTP.value = true;
                        } else {
                          controller.isErrornoKTP.value = false;
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 5,
                      left: 21,
                      child: SvgPicture.asset(AssetName.idCard)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Visibility(
                  visible: controller.isErrornoKTP.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('No KTP is required',
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
                      controller: controller.fotoKTPC,
                      readOnly: true,
                      hintText: 'Foto KTP'.tr,
                      validator: (String? text) {},
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 5,
                      left: 19,
                      child: Icon(
                        Icons.image,
                        size: 25,
                        color: Palette.darkTan,
                      )),
                  Positioned(
                      top: 10,
                      bottom: 10,
                      right: 11,
                      child: ButtonUpload(
                        onTap: () => controller.getImage(),
                        title: 'UPLOAD FILE'.tr,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Visibility(
                  visible: controller.isErrorFotoKTP.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Foto KTP is required',
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
                      controller: controller.alamatC,
                      hintText: 'Alamat Lengkap'.tr,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          controller.isErrorAlamat.value = true;
                        } else {
                          controller.isErrorAlamat.value = false;
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
                        Icons.place,
                        size: 25,
                        color: Palette.darkTan,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Visibility(
                  visible: controller.isErrorAlamat.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Alamat Lengkap is required',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold)),
                  ),
                ),
              ),
              SizedBox(height: 42),
              ButtonGlobal(
                onTap: () => controller.submit(),
                title: 'SUBMIT'.tr,
              ),
              SizedBox(height: 59),
              SizedBox(
                width: 122,
                child: ButtonLewati(
                  onTap: () {
                    Get.offNamed(Routes.HOME);
                  },
                  title: 'LEWATI'.tr,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
