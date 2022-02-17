import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/redeem_history/controllers/redeem_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'history_redeem_item.dart';

class HistoryListReedem extends GetView<RedeemHistoryController> {
  const HistoryListReedem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.symmetric(vertical: 100),
          itemBuilder: (_, index) {
            return HistoryReedemItem(
              index: index,
              dataHistory: state![index],
            );
          }),
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
          child: Text('History are Empty'.tr,
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
    );
  }
}
