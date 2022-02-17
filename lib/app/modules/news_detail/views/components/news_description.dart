import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class DescriptionNews extends StatelessWidget {
  const DescriptionNews({
    Key? key,
    required this.desc,
  }) : super(key: key);

  final String desc;
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: Palette.mineShaft,
          height: 2,
          fontSize: 13,
          fontFamily: AppFontStyle.robotoReg),
    );
  }
}
