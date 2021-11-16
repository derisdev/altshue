import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/language/controllers/language_controller.dart';
import 'package:altshue/app/widgets/tile_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
