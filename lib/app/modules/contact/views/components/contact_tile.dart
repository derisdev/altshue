import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class TileContact extends StatelessWidget {
  const TileContact({
    Key? key,
    required this.title,
    required this.icon,
    this.isSVG = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isSVG;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Palette.darkTan),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 13,
              fontFamily: AppFontStyle.montserratReg),
        ),
      ],
    );
  }
}
