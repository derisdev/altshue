import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: Column(
          children: [
            HeaderBar(
              title: 'About',
            ),
            SizedBox(height: 60),
            Icon(Icons.ac_unit, size: 80),
            SizedBox(height: 54),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 50, bottom: 24),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac ornare nibh. Donec non consequat purus, vitae iaculis quam. Donec pulvinar cursus elit, in tincidunt sapien sagittis et. Donec sit amet diam venenatis, accumsan dui non, mattis felis. Vivamus tempus nulla dui, et congue eros varius tincidunt. Aenean at nulla ac tortor venenatis lacinia ut eu enim. Duis risus sem, maximus eget lobortis ornare, maximus sednisl.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Palette.mineShaft,
                    height: 1.5,
                    fontSize: 15,
                    fontFamily: AppFontStyle.robotoReg),
              ),
            )
          ],
        ));
  }
}
