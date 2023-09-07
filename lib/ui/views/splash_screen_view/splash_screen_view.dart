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
        body: Center(
          child: Column(
          
           children: [
            (height * 0.1).sbheight,
            SvgPicture.asset(
              'assets/images/ahjizlilogo.svg',
              width: width * 0.5,
            ),
            (height * 0.2).sbheight,
            // const Spacer(),
            SpinKitDancingSquare(size: width * 0.15, color: AppColors.mainOrange,),
            (height * 0.1).sbheight,
          ]),
        ),
      ),
    );
  }
}
