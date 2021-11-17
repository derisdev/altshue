import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/bank_account_controller.dart';
import 'components/bank_list_field.dart';
import 'components/option_bank.dart';

class BankAccountView extends GetView<BankAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                HeaderBar(
                  title: 'Bank Account'.tr,
                ),
                SizedBox(height: 30),
                SvgPicture.asset(AssetName.bankIllus),
                SizedBox(height: 30),
                BankOption(
                  controller: controller,
                ),
                SizedBox(height: 10),
                ListFieldBank(
                  controller: controller,
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () => controller.submit(),
                    radius: 8,
                    fontSize: 14,
                    title: 'SUBMIT'.tr,
                  ),
                ),
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
