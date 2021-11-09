import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/header_bar_main.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
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
                TopAccount(),
                SizedBox(height: 13),
                CopyRefferal(controller: controller),
                SizedBox(height: 12),
                LevelPlayer(),
                SizedBox(height: 15),
                ReedemPoint(controller: controller),
                SizedBox(height: 22),
                SettingsMenu()
              ],
            ),
            HeaderMainBar(
              title: 'Account',
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Other',
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 12,
                  fontFamily: AppFontStyle.montserratBold)),
          SizedBox(height: 19),
          Container(
              decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Palette.alto,
                        blurRadius: 4,
                        offset: Offset(0, 1))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.SETTINGS),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 19,
                            color: Palette.gray,
                          ),
                          SizedBox(width: 16),
                          Text('Settings',
                              style: TextStyle(
                                  color: Palette.tundora,
                                  fontSize: 14,
                                  fontFamily: AppFontStyle.montserratReg)),
                          Spacer(),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              size: 15, color: Palette.tundora),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ReedemPoint extends StatelessWidget {
  const ReedemPoint({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(top: 14, left: 21, right: 18, bottom: 14),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Row(
          children: [
            Image.asset(AssetName.ap, height: 31),
            SizedBox(width: 15),
            Text('400',
                style: TextStyle(
                    color: Palette.darkTan,
                    fontSize: 25,
                    fontFamily: AppFontStyle.montserratBold)),
            SizedBox(width: 6),
            Text('A.P',
                style: TextStyle(
                    color: Palette.darkTan,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratBold)),
            Spacer(),
            Stack(
              children: [
                Container(
                    width: 103,
                    height: 29,
                    decoration: BoxDecoration(
                        color: Palette.dixie,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.gift,
                                size: 15, color: Palette.white),
                            SizedBox(width: 9.3),
                            Text('REDEEM',
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
                      onTap: () => Get.toNamed(Routes.REEDEM),
                      child: SizedBox(
                        width: 96,
                        height: 29,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class LevelPlayer extends StatelessWidget {
  const LevelPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        decoration: BoxDecoration(
            color: Palette.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Level',
                    style: TextStyle(
                        color: Palette.tundora,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratBold)),
                SizedBox(height: 4.5),
                Icon(Icons.ac_unit, size: 40),
                SizedBox(height: 4),
                Text('Prodigious',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 10,
                        fontFamily: AppFontStyle.montserratMed)),
              ],
            ),
            Column(
              children: [
                Text('Exp : 1000 / 1000',
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 12,
                        fontFamily: AppFontStyle.montserratMed)),
                SizedBox(height: 10.5),
                SizedBox(
                  width: 178,
                  child: LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: 1,
                    backgroundColor: Palette.dixie.withOpacity(0.25),
                    progressColor: Palette.dixie,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 30),
                FaIcon(FontAwesomeIcons.infinity,
                    size: 28, color: Palette.dixie),
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

class CopyRefferal extends StatelessWidget {
  const CopyRefferal({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AccountController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 119,
            height: 28,
            decoration: BoxDecoration(
                color: Palette.dixie, borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text('J0HND03',
                    style: TextStyle(
                        color: Palette.white,
                        fontSize: 16,
                        fontFamily: AppFontStyle.montserratBold))),
          ),
          Stack(
            children: [
              Container(
                width: 103,
                height: 29,
                decoration: BoxDecoration(
                    color: Palette.alto,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text('COPY REFERAL',
                        style: TextStyle(
                            color: Palette.white,
                            fontSize: 10,
                            fontFamily: AppFontStyle.montserratBold))),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.copyRefferal(),
                    child: SizedBox(
                      width: 96,
                      height: 29,
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

class TopAccount extends StatelessWidget {
  const TopAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.white,
      height: 114,
      child: Row(
        children: [
          SizedBox(
            width: 21,
          ),
          CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width / 3.2,
                child: Text('Adinda',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Palette.darkTan,
                        fontSize: 17,
                        fontFamily: AppFontStyle.montserratBold)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'adinda@gmail.com',
                style: TextStyle(
                    color: Palette.doveGray,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                '08123456789',
                style: TextStyle(
                    color: Palette.doveGray,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed),
              ),
            ],
          ),
          Spacer(),
          Padding(
              padding: const EdgeInsets.only(right: 19.0),
              child: Stack(
                children: [
                  Container(
                    width: 96,
                    height: 29,
                    decoration: BoxDecoration(
                        color: Palette.dixie,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text('EDIT PROFILE',
                            style: TextStyle(
                                color: Palette.white,
                                fontSize: 10,
                                fontFamily: AppFontStyle.montserratBold))),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                        child: SizedBox(
                          width: 96,
                          height: 29,
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
