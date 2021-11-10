import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void showDialogKTPUnverif(
    {required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool isDismissible = true}) {
  Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 250,
          padding: EdgeInsets.only(top: 20),
          width: Get.width,
          decoration: BoxDecoration(
              color: Palette.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SvgPicture.asset(
                AssetName.alertTriangle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(text,
                  style: TextStyle(
                      color: Palette.darkTan,
                      fontSize: 16,
                      fontFamily: AppFontStyle.montserratBold)),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                    'Pengguna aplikasi ALT Shue yang terhormat, pastikan anda telah melkukan verifikasi KTP untuk menikmati fitur lengkap pada Aplikasi',
                    style: TextStyle(
                        color: Palette.mineShaft,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratMed)),
              ),
              SizedBox(
                height: 18,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(child: ButtonDialogKTPVerif.nantisaja()),
                  Expanded(child: ButtonDialogKTPVerif.verifikasi()),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: isDismissible);
}
