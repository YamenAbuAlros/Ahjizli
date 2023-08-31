import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/login_view/login_view.dart';
import 'package:booking_flights/ui/views/main_user_view/main_user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(230),
                        //bottomRight:  Radius.circular(560)
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            AppColors.mainPink,
                            //Appcolor.mainRedAcecnt,
                            AppColors.mainPink,
                            AppColors.mainPink,
                            AppColors.mainRedAcecnt,
                            // Appcolor.mainPink,
                            AppColors.mainRedAcecnt,
                          ])),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.16, height * 0.005,
                        width * 0.1, height * 0.1),
                    child: SvgPicture.asset(
                      'assets/images/PLogo.svg',
                      width: width,
                      height: height * 0.45,
                    ),
                  ),
                ),
              ],
            ),
            (height * 0.1).sbheight,
            CustomButton(
              text: 'Login as a office',
              onPressed: () {
                Get.to(const LoginView());
              },
              paddingLR: width * 0.05,
              backgroundColor: AppColors.mainPink,
              textColor: AppColors.mainWhite,
            ),
            (height * 0.1).sbheight,
            InkWell(
              child: CustomText(
                  fontWeight: FontWeight.bold,
                  text: 'Continue as a user',
                  fontsize: width * 0.05,
                  isDecoration: true,
                  textcolor: AppColors.mainBlack),
              onTap: () {
                Get.to(const MainUserView());
              },
            )
          ],
        ),
      ),
    );
  }
}
