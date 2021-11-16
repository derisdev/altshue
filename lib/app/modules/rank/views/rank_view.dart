import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/rank_controller.dart';
import 'components/rank_current.dart';
import 'components/rank_top_100.dart';
import 'components/rank_top_100_list.dart';
import 'components/rank_type.dart';

class RankView extends GetView<RankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 60),
                CurrentRank(),
                RankType(
                  controller: controller,
                ),
                SizedBox(height: 18),
                Top100Rank(controller: controller),
                Top100RankList()
              ],
            ),
            HeaderMainBar(
              title: 'Rank'.tr,
            ),
            NavigationBar(
              index: 3,
            )
          ],
        ));
  }
}
