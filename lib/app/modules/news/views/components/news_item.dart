import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/news/models/news.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/utils/helpers/data_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.index,
    required this.dataNews,
  }) : super(key: key);

  final int index;
  final DataNews dataNews;

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
            Get.toNamed(Routes.NEWS_DETAIL, arguments: {'id': dataNews.Id});
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
                          dataNews.BannerImage,
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
                          child: Text(dataNews.Title,
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
                            dataNews.Excerpt,
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
                          dateFormat(dataNews.Created),
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
