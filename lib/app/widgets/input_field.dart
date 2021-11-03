import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final bool isNumber;
  final bool readOnly;
  final String? Function(String? value) validator;

  InputField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.validator,
    this.readOnly = false,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextFormField(
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        cursorColor: Colors.black,
        readOnly: readOnly,
        controller: controller,
        style: TextStyle(
            color: Palette.black,
            fontSize: 12,
            fontFamily: AppFontStyle.montserratReg),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 60),
          fillColor: Palette.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Palette.silverChalice,
            fontSize: 12,
            fontFamily: AppFontStyle.montserratReg,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  SearchField({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextField(
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        cursorColor: Colors.black,
        controller: controller,
        style: TextStyle(
            color: Palette.black,
            fontSize: 14,
            fontFamily: AppFontStyle.montserratReg),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Palette.white,
          contentPadding: EdgeInsets.zero,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Palette.silverChalice,
              fontSize: 14,
              fontFamily: AppFontStyle.montserratReg),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.alto),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.alto),
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
