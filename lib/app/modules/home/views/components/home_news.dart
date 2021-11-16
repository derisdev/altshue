import 'package:flutter/material.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';

import 'package:get/get.dart';

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
