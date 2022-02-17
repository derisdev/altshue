import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/bank_account_controller.dart';
import 'components/bank_list_field.dart';
import 'components/option_bank.dart';

class BankAccountView extends GetView<BankAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  color: Palette.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 90,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: ButtonGlobalNoChild(
                                onTap: () => Get.toNamed(Routes.REDEEM_HISTORY),
                                radius: 5,
                                title: 'History'.tr,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('History'.tr,
                                        style: TextStyle(
                                            color: Palette.white,
                                            fontSize: 9,
                                            fontFamily:
                                                AppFontStyle.montserratBold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(AssetName.bankIllus),
                        SizedBox(height: 30),
                        BankOption(
                          controller: controller,
                        ),
                        SizedBox(height: 10),
                        ListFieldBank(
                          controller: controller,
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 186,
                          height: 41,
                          child: Obx(
                            () => ButtonGlobal(
                              onTap: controller.isLoadingButton.value
                                  ? () {}
                                  : () => controller.submit(),
                              radius: 8,
                              fontSize: 14,
                              title: 'SUBMIT'.tr,
                              child: controller.isLoadingButton.value
                                  ? SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 20.0,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 120),
              ],
            ),
            NavigationBar(
              index: 4,
            ),
            HeaderBar(
              title: 'Bank Account'.tr,
            )
          ],
        ));
  }
}
