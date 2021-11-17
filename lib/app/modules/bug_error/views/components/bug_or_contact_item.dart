import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BugOrContactFieldItem extends StatelessWidget {
  const BugOrContactFieldItem({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isMultiline = false,
    required this.validator,
    this.readOnly = false,
    this.isSVG = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final bool isMultiline;
  final bool readOnly;
  final String? Function(String? value) validator;

  final bool isSVG;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UnderlineField(
            controller: controller,
            hintText: hintText,
            isMultiline: isMultiline,
            validator: validator,
            readOnly: readOnly),
        Positioned(
            bottom: 0,
            top: 2,
            left: 0,
            child: isSVG
                ? SvgPicture.asset(
                    AssetName.chatboxes,
                    height: 20,
                  )
                : Icon(icon, color: Palette.gray, size: 25)),
      ],
    );
  }
}
