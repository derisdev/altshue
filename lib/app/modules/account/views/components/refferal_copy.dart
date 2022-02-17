import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/account/controllers/account_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CopyRefferal extends StatelessWidget {
  const CopyRefferal({
    Key? key,
    required this.controller,
    required this.refferalCode,
  }) : super(key: key);

  final AccountController controller;
  final String refferalCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 119,
            height: 28,
            decoration: BoxDecoration(
                color: Palette.dixie, borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(refferalCode,
                    style: TextStyle(
                        color: Palette.white,
                        fontSize: 16,
                        fontFamily: AppFontStyle.montserratBold))),
          ),
          Stack(
            children: [
              Container(
                width: 103,
                height: 29,
                decoration: BoxDecoration(
                    color: Palette.alto,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text('COPY REFERAL'.tr,
                        style: TextStyle(
                            color: Palette.white,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold))),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.copyRefferal(),
                    child: SizedBox(
                      width: 96,
                      height: 29,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
