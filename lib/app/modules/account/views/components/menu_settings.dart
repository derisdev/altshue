import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Other'.tr,
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 12,
                  fontFamily: AppFontStyle.montserratBold)),
          SizedBox(height: 19),
          Container(
              decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Palette.alto,
                        blurRadius: 4,
                        offset: Offset(0, 1))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.SETTINGS),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 19,
                            color: Palette.gray,
                          ),
                          SizedBox(width: 16),
                          Text('Settings'.tr,
                              style: TextStyle(
                                  color: Palette.tundora,
                                  fontSize: 14,
                                  fontFamily: AppFontStyle.montserratReg)),
                          Spacer(),
                          FaIcon(FontAwesomeIcons.chevronRight,
                              size: 15, color: Palette.tundora),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
