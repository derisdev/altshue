import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class TileItem extends StatelessWidget {
  const TileItem({
    Key? key,
    required this.icon,
    required this.title,
    this.textColor = Palette.black,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Icon(icon, color: Palette.gray),
              SizedBox(
                width: 15.6,
              ),
              Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontFamily: AppFontStyle.montserratReg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
