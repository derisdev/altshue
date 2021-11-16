import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class ListSetting extends StatelessWidget {
  const ListSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          TileItem(
            icon: FontAwesomeIcons.lock,
            isSvg: true,
            title: 'Change Password'.tr,
            onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.flag,
            title: 'Language'.tr,
            onTap: () => Get.toNamed(Routes.LANGUAGE),
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.bug_report,
            title: 'Bug Error Report'.tr,
            onTap: () => Get.toNamed(Routes.BUG_ERROR),
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
              title: 'About'.tr,
              onTap: () => Get.toNamed(Routes.ABOUT),
              isSvg: true,
              icon: FontAwesomeIcons.infoCircle),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.call,
            title: 'Contact'.tr,
            onTap: () => Get.toNamed(Routes.CONTACT),
          ),
        ],
      ),
    );
  }
}
