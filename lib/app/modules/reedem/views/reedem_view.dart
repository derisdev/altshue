import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/reedem_controller.dart';

class ReedemView extends GetView<ReedemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        body: Stack(
          children: [
            ListReedem(),
            HeaderBar(
              title: 'Redeem',
            ),
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
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 27),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://www.colorhexa.com/efdcdc.png',
                            fit: BoxFit.cover,
                            width: 88,
                            height: 88,
                          )),
                      SizedBox(
                        width: 16,
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
                                  fontSize: 14,
                                  fontFamily: AppFontStyle.montserratBold)),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Image.asset(AssetName.ap, height: 19),

                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '500 A.P',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Palette.tundora,
                                    fontSize: 14,
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
                              width: 103,
                              height: 29,
                              decoration: BoxDecoration(
                                  color: Palette.dixie,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.gift, size: 15, color: Palette.white),
                                      SizedBox(width: 9.3),
                                      Text('REDEEM',
                                          style: TextStyle(
                                              color: Palette.white,
                                              fontSize: 10,
                                              fontFamily:
                                                  AppFontStyle.montserratBold)),
                                    ]),
                              )),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Get.toNamed(Routes.REEDEM_DETAIL),
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
                ),
              ),
            ),
          )),
    );
  }
}
