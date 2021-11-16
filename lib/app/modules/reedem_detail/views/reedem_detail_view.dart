import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reedem_detail_controller.dart';
import 'components/redeem_button.dart';
import 'components/redeem_description.dart';
import 'components/redeem_image.dart';
import 'components/redeem_title.dart';

class ReedemDetailView extends GetView<ReedemDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Palette.white,
                        height: 300 + 105,
                      ),
                      ImageRedeem(),
                      Positioned(
                          top: 295, left: 0, right: 0, child: TitleRedeem()),
                    ],
                  ),
                  DescriptionRedeem(),
                  SizedBox(height: 24),
                  ReedemButton(),
                  SizedBox(height: 150),
                ],
              ),
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
