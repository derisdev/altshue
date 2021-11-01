import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: Get.height * 0.35,
              color: Colors.red,
              child: Stack(),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left: 24.5, right: 17.5),
                        decoration: BoxDecoration(
                            color: Palette.blueMarguerite.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Mission 1',
                                    style: TextStyle(
                                        color: Palette.black,
                                        fontSize: 10,
                                        fontFamily:
                                            AppFontStyle.montserratBold)),
                                SizedBox(
                                  height: 11.5,
                                ),
                                Persentase(),
                                SizedBox(
                                  height: 12,
                                ),
                                Persentase(),
                                SizedBox(
                                  height: 12,
                                ),
                                Persentase(),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Divider(
                              color: Palette.alto,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Mission 1',
                                    style: TextStyle(
                                        color: Palette.black,
                                        fontSize: 10,
                                        fontFamily:
                                            AppFontStyle.montserratBold)),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

class Persentase extends StatelessWidget {
  const Persentase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.5),
      child: Row(
        children: [
          Icon(
            Icons.ac_unit,
            color: Palette.darkTan,
            size: 15,
          ),
          SizedBox(
            width: 10.7,
          ),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 3 / 5,
              backgroundColor: Palette.thunderbird.withOpacity(0.25),
              progressColor: Palette.thunderbird,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text('3/5 Kilometers',
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 10,
                  fontFamily: AppFontStyle.montserratMed)),
        ],
      ),
    );
  }
}
