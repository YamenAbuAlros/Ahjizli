import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../utilis.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hinttext,
    required this.mheight,
    required this.mwidth,
    this.fontsize,
    this.bradius,
    required this.controller,
    this.errorText,
    this.validator,
    this.label,
    this.ontap,
    this.readonly = false,
    this.keyboardType,
    this.maxlength,
    this.suffixIconName,
  });
  // ignore: prefer_typing_uninitialized_variables
  final keyboardType;
  final String? Function(String?)? validator;
  final String? hinttext;
  final double mheight;
  final double mwidth;
  final double? fontsize;
  final TextEditingController controller;
  final double? bradius;
  final String? errorText;
  final String? label;
  final Function()? ontap;
  final bool readonly;
  final Icon? suffixIconName;
  // ignore: prefer_typing_uninitialized_variables
  final maxlength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxlength,
      keyboardType: keyboardType,
      onTap: ontap,
      textInputAction: TextInputAction.next,
      validator: validator,
      controller: controller,
      readOnly: readonly,
      decoration: InputDecoration(
          suffixIcon: suffixIconName,
          labelText: label ?? '',
          hintText: hinttext,
          hintStyle: TextStyle(
              color: AppColors.mainBlue1, fontSize: fontsize ?? width * 0.04),
          constraints: BoxConstraints(minWidth: mwidth, minHeight: mheight),
          contentPadding: EdgeInsetsDirectional.only(start: width * 0.09),
          filled: true,
          fillColor: AppColors.mainBlue3,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(bradius ?? width * 0.09),
              borderSide: BorderSide(color: AppColors.mainBlack)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(width * 0.1)))),
    );
  }
}
