import 'package:booking_flights/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.onPressed,
    this.imageName,
    required this.paddingLR,
  });

  final String text;

  final String? imageName;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double paddingLR;
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingLR),
      child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.mainOrange,
              side: borderColor != null
                  ? BorderSide(
                      width: 1.0, color: borderColor ?? AppColors.mainWhite)
                  : null,
              minimumSize: Size(size.width * 0.6, size.height * 0.06),
              shape: const StadiumBorder()),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (imageName != null) ...[
              SvgPicture.asset(
                'assets/images/$imageName.svg',
                width: size.width * 0.09,
              ),
              SizedBox(width: size.width * 0.04)
            ],
            Text(text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold))
          ])),
    );
  }
}
