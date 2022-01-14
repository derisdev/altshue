import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/home/views/components/persentase_mission.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MissionProgress extends StatelessWidget {
  const MissionProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
          width: Get.width,
          height: Get.height - 240 - Get.height * 0.35,
          padding: EdgeInsets.only(left: 24.5, right: 17.5),
          decoration: BoxDecoration(
            color: Palette.blueMarguerite.withOpacity(0.10),
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            // ],
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: index != 0 ? 8 : 45,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mission ${index + 1}',
                            style: TextStyle(
                                color: Palette.tundora,
                                fontSize: 10,
                                fontFamily: AppFontStyle.montserratBold)),
                        SizedBox(
                          height: 11.5,
                        ),
                        Persentase.km(),
                        SizedBox(
                          height: 12,
                        ),
                        Persentase.min(),
                        SizedBox(
                          height: 12,
                        ),
                        Persentase.step(),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    index == 2
                        ? SizedBox()
                        : Divider(
                            color: Palette.alto,
                          ),
                  ],
                );
              })),
    );
  }
}
