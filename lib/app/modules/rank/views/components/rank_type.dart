import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/rank/controllers/rank_controller.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
class RankType extends StatelessWidget {
  const RankType({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final RankController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 101,
              height: 27,
              child: ButtonGlobal(
                  onTap: () => controller.toGlobal(),
                  primary: controller.typeRank.value == 0
                      ? Palette.dixie
                      : Palette.darkTan,
                  title: 'GLOBAL',
                  fontSize: 12)),
          SizedBox(
            width: 14,
          ),
          SizedBox(
              width: 101,
              height: 27,
              child: ButtonGlobal(
                  onTap: () => controller.toFriend(),
                  primary: controller.typeRank.value == 1
                      ? Palette.dixie
                      : Palette.darkTan,
                  title: 'FRIENDS'.tr,
                  fontSize: 12))
        ],
      ),
    );
  }
}