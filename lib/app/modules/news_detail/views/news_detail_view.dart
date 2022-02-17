import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_detail_controller.dart';
import 'components/news_description.dart';
import 'components/news_image.dart';
import 'components/news_title.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  @override
  Widget build(BuildContext context) {
    controller.getNewsDetail();
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Stack(
              children: [
                controller.obx(
                  (state) => ListView(
                    padding: EdgeInsets.only(bottom: 200),
                    children: [
                      Column(children: [
                        ImageNews(
                          url: state![0].BannerImage,
                        ),
                        TitleNews(
                          date: state[0].Created,
                          title: state[0].Title,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: DescriptionNews(
                                desc: state[0].Excerpt,
                              )),
                        ),
                      ])
                    ],
                  ),
                  onLoading: SizedBox(
                    height: Get.height - 90,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Palette.dixie),
                      ),
                    ),
                  ),
                  onEmpty: SizedBox(
                    height: Get.height - 90,
                    child: Center(
                      child: Text('News are Empty'.tr,
                          style: TextStyle(
                              color: Palette.black,
                              fontSize: 13,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                  ),
                  onError: (error) => SizedBox(
                    height: Get.height - 90,
                    child: Center(
                      child: Text(error.toString(),
                          style: TextStyle(
                              color: Palette.black,
                              fontSize: 13,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                  ),
                ),
                NavigationBar(
                  index: 2,
                )
              ],
            )));
  }
}
