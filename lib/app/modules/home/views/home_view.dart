import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
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
            TopHome(),
            Expanded(
                child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      MissionProgress(),
                      SizedBox(
                        height: 8,
                      ),
                      TodayActivity(),
                      SizedBox(
                        height: 20,
                      ),
                      NewsHome(),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    color: Palette.black.withOpacity(0.7),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Pair with bluetooth\nto unlock all features',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 14,
                                  fontFamily: AppFontStyle.montserratBold)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
        Mission()
      ],
    ));
  }
}

class TopHome extends StatelessWidget {
  const TopHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.35,
          color: Palette.darkTan,
        ),
        Positioned(
          top: 32,
          left: 0,
          right: 0,
          child: Icon(Icons.ac_unit, size: 150),
        ),
        Container(
          height: Get.height * 0.35,
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_circle_outline_sharp),
                  Icon(Icons.battery_alert),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 68,
                      height: 24,
                      child: ButtonUpload(onTap: () {}, title: 'PAIRED')),
                  Container(
                    height: 23,
                    width: 179,
                    decoration: BoxDecoration(
                        color: Color(0xffEABD6C),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Palette.white)),
                    child: Center(
                      child: Text('Exp : 1000 / 1000',
                          style: TextStyle(
                              color: Palette.white,
                              fontSize: 10,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                  ),
                  SizedBox(
                      width: 68,
                      height: 24,
                      child: ButtonUpload(onTap: () {}, title: 'NEWS'))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

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
                  Text('Mission',
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
                            Icon(Icons.ac_unit, size: 50),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Distance',
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratMed)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.ac_unit, size: 50),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Hours',
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratMed)),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.ac_unit, size: 50),
                            SizedBox(
                              height: 6,
                            ),
                            Text('Steps',
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

class NewsHome extends StatelessWidget {
  const NewsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 20),
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Palette.alto),
                );
              },
              itemBuilder: (_, index) {
                return ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(index != 0 ? 0 : 20),
                        topRight: Radius.circular(index != 0 ? 0 : 20)),
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.NEWS_DETAIL);
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 21,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 28),
                                    Row(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU',
                                              fit: BoxFit.cover,
                                              width: 88,
                                              height: 88,
                                            )),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width / 2,
                                              child: Text(
                                                  'Daftar Area dengan Jaringan 5G di Indonesia',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Palette.darkTan,
                                                      fontSize: 12,
                                                      fontFamily: AppFontStyle
                                                          .montserratBold)),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            SizedBox(
                                              width: Get.width / 2,
                                              child: Text(
                                                'Lorem Ipsum dolor sit amet, lorem ipsum sit amet dolor...',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Palette.mineShaft,
                                                    fontSize: 10,
                                                    fontFamily: AppFontStyle
                                                        .montserratReg),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              '22 Oct 2021',
                                              style: TextStyle(
                                                  color: Palette.dustyGray,
                                                  fontSize: 10,
                                                  fontFamily: AppFontStyle
                                                      .montserratReg),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                )))));
              },
            )));
  }
}

class TodayActivity extends StatelessWidget {
  const TodayActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 13),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Today Activity',
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 12,
                  fontFamily: AppFontStyle.montserratBold)),
          Column(
            children: [
              Icon(Icons.timelapse, color: Palette.silverChalice, size: 20),
              Row(
                children: [
                  Text('3',
                      style: TextStyle(
                          color: Palette.darkTan,
                          fontSize: 28,
                          fontFamily: AppFontStyle.montserratBoldItalic)),
                  SizedBox(
                    width: 4,
                  ),
                  Text('km',
                      style: TextStyle(
                          color: Palette.darkTan,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratBoldItalic)),
                ],
              ),
              Text('DISTANCE',
                  style: TextStyle(
                      color: Palette.darkTan,
                      fontSize: 8,
                      fontFamily: AppFontStyle.montserratMed)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.timelapse, color: Palette.silverChalice, size: 20),
              Row(
                children: [
                  Text('5',
                      style: TextStyle(
                          color: Palette.darkTan,
                          fontSize: 28,
                          fontFamily: AppFontStyle.montserratBoldItalic)),
                  SizedBox(
                    width: 4,
                  ),
                  Text('min',
                      style: TextStyle(
                          color: Palette.darkTan,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratBoldItalic)),
                ],
              ),
              Text('HOUR',
                  style: TextStyle(
                      color: Palette.darkTan,
                      fontSize: 8,
                      fontFamily: AppFontStyle.montserratMed)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.timelapse, color: Palette.silverChalice, size: 20),
              Text('500',
                  style: TextStyle(
                      color: Palette.darkTan,
                      fontSize: 28,
                      fontFamily: AppFontStyle.montserratBoldItalic)),
              Text('STEPS',
                  style: TextStyle(
                      color: Palette.darkTan,
                      fontSize: 8,
                      fontFamily: AppFontStyle.montserratMed)),
            ],
          ),
        ],
      ),
    );
  }
}

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
              physics: NeverScrollableScrollPhysics(),
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
                        Text('Mission 1',
                            style: TextStyle(
                                color: Palette.black,
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

class Persentase extends StatelessWidget {
  const Persentase({
    Key? key,
    required this.icon,
    required this.percent,
    required this.progress,
  }) : super(key: key);

  final IconData icon;
  final double percent;
  final String progress;

  factory Persentase.km() {
    return Persentase(
      icon: Icons.ac_unit,
      percent: 3 / 5,
      progress: '3/5 Kilometers',
    );
  }
  factory Persentase.min() {
    return Persentase(
      icon: Icons.timelapse,
      percent: 1 / 2,
      progress: '5/10 Minutes',
    );
  }
  factory Persentase.step() {
    return Persentase(
      icon: Icons.air,
      percent: 7 / 10,
      progress: '700/1000 Steps',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.5),
      child: Row(
        children: [
          Icon(
            icon,
            color: Palette.darkTan,
            size: 15,
          ),
          SizedBox(
            width: 10.7,
          ),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: percent,
              backgroundColor: Palette.thunderbird.withOpacity(0.25),
              progressColor: Palette.thunderbird,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(progress,
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 10,
                  fontFamily: AppFontStyle.montserratMed)),
        ],
      ),
    );
  }
}
