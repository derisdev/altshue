import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
          height: 72,
          width: Get.width,
          // margin: EdgeInsets.symmetric(horizontal: 23),
          decoration: BoxDecoration(
            color: Palette.darkTan,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            // ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => Get.toNamed(Routes.FRIENDS),
                        child: SvgPicture.asset(AssetName.friends)),
                    Visibility(
                      visible: index == 0,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: Container(
                        width: 30,
                        height: 3,
                        margin: EdgeInsets.only(bottom: 8, top: 2),
                        decoration: BoxDecoration(
                            color: Palette.dixie,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => Get.toNamed(Routes.MISSION),
                        child: SvgPicture.asset(AssetName.mission)),
                    Visibility(
                      visible: index == 1,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: Container(
                        width: 30,
                        height: 3,
                        margin: EdgeInsets.only(bottom: 8, top: 2),
                        decoration: BoxDecoration(
                            color: Palette.dixie,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Get.offAllNamed(Routes.HOME),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 5,
                          left: 5,
                          right: 5,
                          top: 5,
                          child: SvgPicture.asset(AssetName.ellipse2)),
                      Visibility(
                        visible: index == 2,
                        maintainSize: true,
                        maintainState: true,
                        maintainAnimation: true,
                        child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AssetName.ellipse3,
                            )),
                      ),
                      Positioned(
                          bottom: 23,
                          left: 23,
                          right: 23,
                          top: 23,
                          child: Image.asset(AssetName.shoesRed)),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => Get.toNamed(Routes.RANK),
                        child: SvgPicture.asset(AssetName.rank)),
                    Visibility(
                      visible: index == 3,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: Container(
                        width: 30,
                        height: 3,
                        margin: EdgeInsets.only(bottom: 8, top: 2),
                        decoration: BoxDecoration(
                            color: Palette.dixie,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => Get.toNamed(Routes.ACCOUNT),
                        child: SvgPicture.asset(AssetName.account)),
                    Visibility(
                      visible: index == 4,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: Container(
                        width: 30,
                        height: 3,
                        margin: EdgeInsets.only(bottom: 8, top: 2),
                        decoration: BoxDecoration(
                            color: Palette.dixie,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
