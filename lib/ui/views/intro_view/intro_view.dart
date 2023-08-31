import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/intro_view/intro_controller.dart';
import 'package:booking_flights/ui/views/landing_view/landing_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => Column(
                children: [
                  (height * 0.1).sbheight,
                  SvgPicture.asset(
                    'assets/images/intro${controller.currentindex.value}.svg',
                    // fit: BoxFit.fill,
                    width: width,
                    height: height * 0.4,
                  ),
                  (height * 0.04).sbheight,
                  DotsIndicator(
                    dotsCount: 3,
                    position: controller.currentindex.value.toDouble(),
                    decorator: DotsDecorator(
                      color: AppColors.mainBlueforText, // Inactive color
                      activeColor: AppColors.mainOrange,
                    ),
                  ),
                  (height * 0.06).sbheight,
                  CustomText(
                      text: controller.titleList[controller.currentindex.value],
                      textcolor: AppColors.mainBlueforText,
                      fontWeight: FontWeight.bold,
                      fontsize: width * 0.07),
                  (height * 0.04).sbheight,
                  Text(
                    controller.descriptionList[controller.currentindex.value],
                    textAlign: TextAlign.center,
                  ),
                  (height * 0.06).sbheight,
                  CustomButton(
                    text:
                        controller.currentindex.value != 2 ? "Next" : "Finish",
                    paddingLR: width * 0.1,
                    textColor: AppColors.mainWhite,
                    onPressed: () {
                      controller.currentindex.value != 2
                          ? controller.incrementIndex()
                          : Get.off(() => const LandingView());
                    },
                  ),
                ],
              ))),
    );
  }
}
