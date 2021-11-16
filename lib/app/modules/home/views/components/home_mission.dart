import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Mission extends StatelessWidget {
  const Mission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * 0.35 - 50,
      left: 20,
      right: 20,
      child: Container(
          height: 145,
          width: Get.width,
          decoration: BoxDecoration(
              color: Palette.wildSand,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 11),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Palette.alto,
                        blurRadius: 4,
                        offset: Offset(0, 1))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mission'.tr,
                      style: TextStyle(
                          color: Palette.tundora,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratBold)),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(AssetName.distance),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Distance'.tr,
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratMed)),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(AssetName.hours),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Hours'.tr,
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratMed)),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(AssetName.steps),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Steps'.tr,
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratMed)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
