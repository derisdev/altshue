import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/reedem_controller.dart';

class ReedemView extends GetView<ReedemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListReedem(),
            HeaderBar(
              title: 'Redeem',
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}

class ListReedem extends StatelessWidget {
  const ListReedem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.symmetric(vertical: 100),
        itemBuilder: (_, index) {
          return ReedemItem(
            index: index,
          );
        });
  }
}

class ReedemItem extends StatelessWidget {
  const ReedemItem({
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Get.toNamed(Routes.REEDEM_DETAIL),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 25),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://www.colorhexa.com/efdcdc.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          )),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Coupon 1',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Palette.darkTan,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.montserratBold)),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Image.asset(AssetName.ap, height: 18),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '500 A.P',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 12,
                                    fontFamily: AppFontStyle.montserratReg),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          Container(
                              width: 95,
                              height: 27,
                              decoration: BoxDecoration(
                                  color: Palette.dixie,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.gift,
                                          size: 13, color: Palette.white),
                                      SizedBox(width: 5.3),
                                      Text('REDEEM',
                                          style: TextStyle(
                                              color: Palette.white,
                                              fontSize: 9,
                                              fontFamily:
                                                  AppFontStyle.montserratBold)),
                                    ]),
                              )),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Get.toNamed(Routes.BANK_ACCOUNT),
                                child: SizedBox(
                                  width: 95,
                                  height: 27,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
