import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/rank_rewards_controller.dart';

class RankRewardsView extends GetView<RankRewardsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                HeaderBar(
                  title: 'Rank Rewards'.tr,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: Get.height - 200,
                  width: Get.width - 60,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: BorderSide(color: Palette.alto)),
                    child: Column(
                      children: [
                        Container(
                          height: 47,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Palette.darkTan,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  topRight: Radius.circular(7))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.trophy,
                                        size: 19, color: Palette.dixie),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text('Rank'.tr,
                                        style: TextStyle(
                                            color: Palette.white,
                                            fontSize: 12,
                                            fontFamily:
                                                AppFontStyle.montserratBold)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Palette.white,
                                      child:
                                          Image.asset(AssetName.ap, height: 19),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text('REWARDS A.P'.tr,
                                        style: TextStyle(
                                            color: Palette.white,
                                            fontSize: 12,
                                            fontFamily:
                                                AppFontStyle.montserratBold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                                itemCount: 12,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  return Container(
                                    height: 46,
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    color: index % 2 != 0
                                        ? Palette.pearlLusta
                                        : Palette.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text((index + 1).toString(),
                                            style: TextStyle(
                                                color: Palette.darkTan,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 20,
                                                fontFamily: AppFontStyle
                                                    .montserratBold)),
                                        Text('1000 A.P',
                                            style: TextStyle(
                                                color: Palette.darkTan,
                                                fontSize: 16,
                                                fontFamily: AppFontStyle
                                                    .montserratMed)),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            NavigationBar(
              index: 3,
            )
          ],
        ));
  }
}
