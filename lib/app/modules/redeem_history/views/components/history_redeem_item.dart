import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryReedemItem extends StatelessWidget {
  const HistoryReedemItem({
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
                  child: Builder(builder: (context) {
                    return Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Image.asset(AssetName.ap, height: 22),
                                SizedBox(
                                  width: 7,
                                ),
                                Text('100',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Palette.darkTan,
                                        fontSize: 20,
                                        fontFamily:
                                            AppFontStyle.montserratBold)),
                              ],
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'A.P',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Palette.darkTan,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.montserratBold),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                                text: TextSpan(text: 'status', children: [
                              TextSpan(
                                  text: 'Status: '.tr,
                                  style: TextStyle(
                                      color: Palette.doveGray,
                                      fontSize: 14,
                                      fontFamily: AppFontStyle.montserratMed)),
                              TextSpan(
                                  text:
                                      index == 0 ? 'Processing'.tr : 'Done'.tr,
                                  style: TextStyle(
                                      color: index == 0
                                          ? Palette.darkTan
                                          : Palette.dixie,
                                      fontSize: 14,
                                      fontFamily: AppFontStyle.montserratBold)),
                            ])),
                            SizedBox(
                              height: 12,
                            ),
                            Text('8/12/21',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Palette.silver,
                                    fontSize: 10,
                                    fontFamily: AppFontStyle.montserratMed)),
                          ],
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
          )),
    );
  }
}
