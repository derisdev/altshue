import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_item.dart';

class ListNews extends GetView<NewsController> {
  const ListNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 120),
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
            child: controller.obx(
              (state) => ListView.separated(
                itemCount: state!.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20),
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, index) {
                  return Divider(color: Palette.alto);
                },
                itemBuilder: (_, index) {
                  return NewsItem(
                    index: index,
                    dataNews: state[index],
                  );
                },
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
          )),
    );
  }
}
