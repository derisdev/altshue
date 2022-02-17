import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';
import 'components/account_top.dart';
import 'components/menu_settings.dart';
import 'components/player_level.dart';
import 'components/redeem_point.dart';
import 'components/refferal_copy.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            controller.obx(
                (state) => ListView(
                      children: [
                        SizedBox(height: 60),
                        TopAccount(
                          dataAccount: state,
                        ),
                        SizedBox(height: 13),
                        CopyRefferal(
                          controller: controller,
                          refferalCode: state!.ReferralCode,
                        ),
                        SizedBox(height: 12),
                        LevelPlayer(),
                        SizedBox(height: 15),
                        ReedemPoint(
                          controller: controller,
                          apTotal: state.gift.AP,
                        ),
                        SizedBox(height: 22),
                        SettingsMenu()
                      ],
                    ),
                onEmpty: SizedBox(
                  height: Get.height,
                  child: Center(
                    child: Text('Data is Empty'),
                  ),
                ),
                onError: (message) => SizedBox(
                      height: Get.height,
                      child: Center(
                        child: Text(message.toString()),
                      ),
                    ),
                onLoading: SizedBox(
                  height: Get.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Palette.dixie),
                    ),
                  ),
                )),
            HeaderMainBar(
              title: 'Account'.tr,
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
