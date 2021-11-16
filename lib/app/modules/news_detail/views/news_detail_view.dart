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
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Stack(
              children: [
                ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Palette.white,
                          height: Get.height,
                        ),
                        ImageNews(),
                        Positioned(
                            top: 295,
                            left: 0,
                            right: 0,
                            child: Column(children: [
                              TitleNews(),
                              DescriptionNews(),
                            ])),
                      ],
                    ),
                    SizedBox(height: 40)
                  ],
                ),
                NavigationBar(
                  index: 2,
                )
              ],
            )));
  }
}
