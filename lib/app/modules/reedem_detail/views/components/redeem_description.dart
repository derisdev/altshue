import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class DescriptionRedeem extends StatelessWidget {
  const DescriptionRedeem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 35.0, right: 50, top: 36, bottom: 24),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac ornare nibh. Donec non consequat purus, vitae iaculis quam. Donec pulvinar cursus elit, in tincidunt sapien sagittis et. Donec sit amet diam venenatis, accumsan dui non, mattis felis. Vivamus tempus nulla dui, et congue eros varius tincidunt. Aenean at nulla ac tortor venenatis lacinia ut eu enim. Duis risus sem, maximus eget lobortis ornare, maximus sednisl.',
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Palette.mineShaft,
            height: 1.5,
            fontSize: 15,
            fontFamily: AppFontStyle.robotoReg),
      ),
    );
  }
}
