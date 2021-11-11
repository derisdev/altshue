import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListNews(),
            HeaderBar(
              title: 'News'.tr,
            ),
            NavigationBar(
              index: 2,
            )
          ],
        ));
  }
}

class ListNews extends StatelessWidget {
  const ListNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 20),
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
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 20),
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) {
                return Divider(color: Palette.alto);
              },
              itemBuilder: (_, index) {
                return NewsItem(
                  index: index,
                );
              },
            ),
          )),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2,
                          child: Text(
                              'Daftar Area dengan Jaringan 5G di Indonesia',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Palette.darkTan,
                                  fontSize: 12,
                                  fontFamily: AppFontStyle.montserratBold)),
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
                                fontFamily: AppFontStyle.montserratReg),
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
                              fontFamily: AppFontStyle.montserratReg),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: index == 9 ? 0 : 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
