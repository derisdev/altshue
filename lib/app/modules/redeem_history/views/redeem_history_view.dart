import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/redeem_history_controller.dart';
import 'components/history_redeem_list.dart';

class RedeemHistoryView extends GetView<RedeemHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            HistoryListReedem(),
            HeaderBar(
              title: 'Redeem History'.tr,
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
