import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reedem_controller.dart';
import 'components/redeem_list.dart';

class ReedemView extends GetView<ReedemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListReedem(),
            HeaderBar(
              title: 'Redeem',
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}
