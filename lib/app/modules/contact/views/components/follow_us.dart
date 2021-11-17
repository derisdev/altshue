import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FollowUs extends StatelessWidget {
  const FollowUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          ],
        ),
        SizedBox(height: 6.3),
        Text(
          'Follow Our Social Media'.tr,
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 10,
              fontFamily: AppFontStyle.montserratReg),
        ),
        SizedBox(height: 6),
        Text(
          '@altshue',
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 10,
              fontFamily: AppFontStyle.montserratBold),
        ),
      ],
    );
  }
}
