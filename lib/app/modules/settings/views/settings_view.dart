import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/tile_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: Column(
          children: [
            HeaderBar(
              title: 'Settings',
            ),
            SizedBox(height: 20),
            ListSetting(),
            SizedBox(height: 30),
            SizedBox(
              width: 186,
              height: 41,
              child: ButtonGlobal(
                onTap: () {},
                primary: Palette.darkTan,
                radius: 8,
                fontSize: 14,
                title: 'LOGOUT',
              ),
            ),
          ],
        ));
  }
}

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
            title: 'Change Password',
            onTap: () {},
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.flag,
            title: 'Language',
            onTap: () {},
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.bug_report,
            title: 'Bug Error Report',
            onTap: () {},
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.warning,
            title: 'About',
            onTap: () {},
          ),
          Divider(
            color: Palette.alto,
          ),
          TileItem(
            icon: Icons.call,
            title: 'Contact',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
