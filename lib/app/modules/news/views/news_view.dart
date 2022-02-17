import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_controller.dart';
import 'components/news_list.dart';

class NewsView extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox(height: Get.height),
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
