import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final bool isNumber;
  final bool isEmail;
  final bool readOnly;
  final String? Function(String? value) validator;

  InputField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.validator,
    this.readOnly = false,
    this.isNumber = false,
    this.isEmail = false,
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
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isNumber
                ? TextInputType.number
                : TextInputType.text,
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
  final Function(String) onChanged;

  SearchField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextField(
        textCapitalization: TextCapitalization.none,
        onChanged: onChanged,
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

class UnderlineField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isMultiline;
  final String? Function(String? value) validator;
  final bool readOnly;

  UnderlineField({
    required this.controller,
    required this.hintText,
    this.isMultiline = false,
    required this.validator,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextFormField(
        textCapitalization: TextCapitalization.none,
        maxLines: isMultiline ? null : 1,
        cursorColor: Colors.black,
        validator: validator,
        controller: controller,
        readOnly: readOnly,
        style: TextStyle(
            color: Palette.black,
            fontSize: 14,
            fontFamily: AppFontStyle.montserratReg),
        keyboardType:
            isMultiline ? TextInputType.multiline : TextInputType.text,
        decoration: InputDecoration(
          fillColor: Palette.white,
          contentPadding: EdgeInsets.only(left: 40, bottom: 10, top: 10),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Palette.silverChalice,
              fontSize: 14,
              fontFamily: AppFontStyle.montserratReg),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: readOnly ? Colors.transparent : Palette.alto),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: readOnly ? Colors.transparent : Palette.alto),
          ),
        ),
        textInputAction:
            isMultiline ? TextInputAction.newline : TextInputAction.next,
      ),
    );
  }
}

class CleanField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String? value) validator;

  CleanField({
    required this.controller,
    required this.hintText,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: TextFormField(
        textCapitalization: TextCapitalization.none,
        maxLines: 1,
        keyboardType: textInputType,
        cursorColor: Colors.black,
        validator: validator,
        controller: controller,
        style: TextStyle(
            color: Palette.black,
            fontSize: 14,
            fontFamily: AppFontStyle.robotoReg),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 0, bottom: 10, top: 10),
          fillColor: Palette.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Palette.silverChalice,
              fontSize: 14,
              fontFamily: AppFontStyle.robotoReg),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.alto),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.alto),
          ),
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}
