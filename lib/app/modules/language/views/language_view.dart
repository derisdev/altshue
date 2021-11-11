import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:altshue/app/widgets/tile_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                HeaderBar(
                  title: 'Language'.tr,
                ),
                SizedBox(height: 20),
                ListLanguage(
                  controller: controller,
                ),
                SizedBox(height: 108),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () => controller.changeLanguage(),
                    radius: 8,
                    fontSize: 14,
                    title: 'SAVE'.tr,
                  ),
                ),
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}

class ListLanguage extends StatelessWidget {
  const ListLanguage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LanguageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Obx(
            () => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Palette.alto
                  .withOpacity(controller.selectedIndo.value ? 0.5 : 0),
              child: TileItem(
                icon: Icons.lock,
                imgSrc: AssetName.flagIndo,
                isImage: true,
                title: 'Bahasa Indonesia',
                onTap: () => controller.selectIndo(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Palette.alto,
            ),
          ),
          Obx(
            () => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Palette.alto
                  .withOpacity(controller.selectedEng.value ? 0.5 : 0),
              child: TileItem(
                  icon: Icons.flag,
                  imgSrc: AssetName.flagEnglish,
                  isImage: true,
                  title: 'English',
                  onTap: () => controller.selectEnglish()),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Palette.alto,
            ),
          ),
        ],
      ),
    );
  }
}
