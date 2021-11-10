import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TileItem extends StatelessWidget {
  const TileItem({
    Key? key,
    required this.icon,
    required this.title,
    this.textColor = Palette.black,
    required this.onTap,
    this.isSvg = false,
    this.isImage = false,
    this.imgSrc = '',
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color textColor;
  final VoidCallback onTap;
  final bool isSvg;
  final bool isImage;
  final String imgSrc;

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
              isImage
                  ? Image.asset(
                      imgSrc,
                      height: 13,
                    )
                  : isSvg
                      ? Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: FaIcon(icon, size: 20, color: Palette.gray),
                        )
                      : Icon(icon, color: Palette.gray),
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
