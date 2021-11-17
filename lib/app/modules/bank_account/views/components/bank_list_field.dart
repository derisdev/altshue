import 'package:altshue/app/modules/bank_account/controllers/bank_account_controller.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:altshue/app/constants/colors.dart';

import 'package:get/get.dart';

class ListFieldBank extends StatelessWidget {
  const ListFieldBank({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BankAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            CleanField(
              controller: controller.numberPWC,
              hintText: 'Bank Account Number'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorNumber.value = true;
                } else {
                  controller.isErrorNumber.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorNumber.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Bank Account Number is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CleanField(
              controller: controller.namePWC,
              hintText: 'Bank Account Name'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorName.value = true;
                } else {
                  controller.isErrorName.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorName.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Bank Account Name is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
