import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/rank/controllers/rank_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class Top100Rank extends StatelessWidget {
  const Top100Rank({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RankController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.trophy, size: 19, color: Palette.dixie),
          SizedBox(width: 6),
          Text('Top 100 Rank'.tr,
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 12,
                  fontFamily: AppFontStyle.montserratBold)),
          Spacer(),
          InkWell(
              onTap: () => controller.onTapSort(),
              child: RotationTransition(
                turns:
                    Tween(begin: 0.0, end: 1.0).animate(controller.animationC),
                child: SvgPicture.asset(
                  AssetName.arrowThickTop,
                  height: 15,
                ),
              )),
          SizedBox(width: 15),
          Stack(
            children: [
              Container(
                  width: 95,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Palette.dixie,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.infoCircle,
                              size: 15, color: Palette.white),
                          SizedBox(width: 5),
                          Text('REWARDS'.tr,
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 10,
                                  fontFamily: AppFontStyle.montserratBold)),
                        ]),
                  )),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.RANK_REWARDS),
                    child: SizedBox(
                      width: 95,
                      height: 25,
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
