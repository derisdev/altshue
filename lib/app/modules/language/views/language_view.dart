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
                  title: 'Language',
                ),
                SizedBox(height: 20),
                ListLanguage(),
                SizedBox(height: 108),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () {},
                    radius: 8,
                    fontSize: 14,
                    title: 'SAVE',
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          TileItem(
            icon: Icons.lock,
            imgSrc: AssetName.flagIndo,
            isImage: true,
            title: 'Bahasa Indonesia',
            onTap: () {},
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.flag,
            imgSrc: AssetName.flagEnglish,
            isImage: true,
            title: 'English',
            onTap: () {},
          ),
          Divider(
            color: Palette.alto,
          ),
        ],
      ),
    );
  }
}
