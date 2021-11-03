import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/rank_controller.dart';

class RankView extends GetView<RankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
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
              title: 'Rank',
            ),
          ],
        ));
  }
}

class Top100RankList extends StatelessWidget {
  const Top100RankList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 100),
          itemBuilder: (_, index) {
            return Top100RankITem(
              index: index,
            );
          }),
    );
  }
}

class Top100RankITem extends StatelessWidget {
  const Top100RankITem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Container(
            decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
                ]),
            child: Row(
              children: [
                Container(
                  height: 98,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Palette.darkTan,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Center(
                    child: Text('${index + 1}',
                        style: TextStyle(
                            color: Palette.white,
                            fontSize: 30,
                            fontFamily: AppFontStyle.montserratBoldItalic)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 3.2,
                      child: Text('John Doe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Palette.darkTan,
                              fontSize: 17,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(Icons.ac_unit),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Prodigious',
                          style: TextStyle(
                              color: Palette.doveGray,
                              fontSize: 14,
                              fontFamily: AppFontStyle.montserratMed),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                      width: 71,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Palette.dixie,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Exp : ',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.montserratMed)),
                          Text('200',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.montserratBold)),
                        ],
                      )),
                    ))
              ],
            )));
  }
}

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
          Icon(Icons.ac_unit),
          Text('Top 100 Rank',
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
                child: Icon(Icons.arrow_upward)),
          ),
        ],
      ),
    );
  }
}

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
              width: 103,
              height: 29,
              child: ButtonGlobal(
                  onTap: () => controller.toGlobal(),
                  primary: controller.typeRank.value == 0
                      ? Palette.dixie
                      : Palette.darkTan,
                  title: 'GLOBAL',
                  fontSize: 13)),
          SizedBox(
            width: 14,
          ),
          SizedBox(
              width: 103,
              height: 29,
              child: ButtonGlobal(
                  onTap: () => controller.toFriend(),
                  primary: controller.typeRank.value == 1
                      ? Palette.dixie
                      : Palette.darkTan,
                  title: 'FRIENDS',
                  fontSize: 13))
        ],
      ),
    );
  }
}

class CurrentRank extends StatelessWidget {
  const CurrentRank({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(top: 26, left: 20, right: 31, bottom: 29),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.ac_unit, size: 70),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Adinda',
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 17,
                                fontFamily: AppFontStyle.montserratBold)),
                        Container(
                          width: 63,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Palette.darkTan,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text('No.70',
                                style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratBold)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 178,
                  child: LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: 1,
                    backgroundColor: Palette.dixie.withOpacity(0.25),
                    progressColor: Palette.dixie,
                  ),
                ),
                SizedBox(height: 14),
                Text('Exp : 1000 / 1000',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            ),
            Column(
              children: [
                Icon(Icons.ac_unit, size: 20),
                SizedBox(height: 9.5),
                Text('Max Level',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 10,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            )
          ],
        ));
  }
}
