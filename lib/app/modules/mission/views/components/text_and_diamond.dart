import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class TextAndDiamond extends StatelessWidget {
  const TextAndDiamond({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                color: Palette.doveGray,
                fontSize: 8,
                fontFamily: AppFontStyle.montserratBold)),
        SizedBox(
          height: 5,
        ),
        Image.asset(icon, height: 38),
        SizedBox(
          height: 5,
        ),
        Text('Diamonds',
            style: TextStyle(
                color: Palette.eastSide,
                fontSize: 6,
                fontFamily: AppFontStyle.montserratMed)),
      ],
    );
  }
}
