import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/views/splash_screen_view/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';
import '../../shared/utilis.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.only(
          //         bottomLeft: Radius.circular(230),
          //         //bottomRight:  Radius.circular(560)
          //       ),
          //       gradient: LinearGradient(
          //           begin: Alignment.bottomLeft,
          //           end: Alignment.topRight,
          //           colors: [
          //             AppColors.mainPink,
          //             AppColors.mainPink,
          //             AppColors.mainPink,
          //             AppColors.mainRedAcecnt,
          //             AppColors.mainRedAcecnt,
          //           ])),
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(
          //         width * 0.16, height * 0.005, width * 0.1, height * 0.1),
          //     child: SvgPicture.asset(
          //       'assets/images/logo.svg',
          //       width: width,
          //       height: height * 0.45,
          //     ),
          //   ),
          // ),
          (height * 0.1).sbheight,

          SvgPicture.asset(
            'assets/images/ahjizlilogo.svg',
            width: width * 0.5,
          ),
          (height * 0.2).sbheight,
          // Center(child: SvgPicture.asset('assets/images/logo.svg')),
          // CustomText(
          //   text: 'Welcome to Ahjazili',
          //   textcolor: AppColors.mainBlack,
          //   fontsize: width * 0.05,
          //   fontWeight: FontWeight.bold,
          // ),
          Spacer(),
          SpinKitThreeBounce(size: width * 0.15, color: AppColors.mainOrange),
          (height * 0.1).sbheight,
        ]),
      ),
    );
  }
}
