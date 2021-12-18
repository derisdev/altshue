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
                  padding: EdgeInsets.only(bottom: 200),
                  children: [
                    Column(children: [
                      ImageNews(),
                      TitleNews(),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: DescriptionNews()),
                    ])
                  ],
                ),
                NavigationBar(
                  index: 2,
                )
              ],
            )));
  }
}
