import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/rank_controller.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                  height: 94,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Palette.darkTan,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Center(
                    child: Text('${index + 1}',
                        style: TextStyle(
                            color: Palette.white,
                            fontSize: 27,
                            fontFamily: AppFontStyle.montserratBoldItalic)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width / 3.5,
                      color: Colors.amber,
                      child: Text('John Doe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Palette.darkTan,
                              fontSize: 15,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AssetName.prodigious,
                          height: 18,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Prodigious',
                          style: TextStyle(
                              color: Palette.doveGray,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratMed),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 66,
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
                                  fontSize: 11,
                                  fontFamily: AppFontStyle.montserratMed)),
                          Text('200',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 11,
                                  fontFamily: AppFontStyle.montserratBold)),
                        ],
                      )),
                    )),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetName.prodigious,
              height: 68,
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 28,
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
                                fontSize: 16,
                                fontFamily: AppFontStyle.montserratBold)),
                        SizedBox(height: 5),
                        Container(
                          width: 61,
                          height: 21,
                          decoration: BoxDecoration(
                              color: Palette.darkTan,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text('No.70',
                                style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 11,
                                    fontFamily: AppFontStyle.montserratBold)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 155,
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
                        fontSize: 11,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            ),
            Column(
              children: [
                FaIcon(FontAwesomeIcons.infinity,
                    size: 40, color: Palette.dixie),
                SizedBox(height: 9.5),
                Text('Max Level'.tr,
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 11,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            )
          ],
        ));
  }
}
