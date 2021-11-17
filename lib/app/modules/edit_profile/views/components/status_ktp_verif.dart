import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StatusVerifKTP extends StatelessWidget {
  const StatusVerifKTP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Status :',
                  style: TextStyle(
                      color: Palette.silverChalice,
                      fontSize: 10,
                      fontFamily: AppFontStyle.montserratMed)),
              SizedBox(height: 5),
              Text('Belum Verifikasi KTP'.tr,
                  style: TextStyle(
                      color: Palette.silverChalice,
                      fontSize: 12,
                      fontFamily: AppFontStyle.montserratBold)),
            ],
          ),
          SizedBox(
            width: 100,
            height: 29,
            child: ButtonGlobal(
              onTap: () => Get.toNamed(Routes.KTP_VERIF),
              radius: 5,
              fontSize: 10,
              primary: Palette.darkTan,
              title: 'ISI DATA KTP'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
