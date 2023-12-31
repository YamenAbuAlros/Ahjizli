import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.textcolor,
    this.fontsize,
    this.fontWeight,
    this.backgroundColor,
    this.isDecoration = false,
  });
  final String text;
  final double? fontsize;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final bool isDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: isDecoration ? TextDecoration.underline : null,
        backgroundColor: backgroundColor,
        color: textcolor ?? AppColors.mainBlue1,
        fontSize: fontsize ?? width * 0.04,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
