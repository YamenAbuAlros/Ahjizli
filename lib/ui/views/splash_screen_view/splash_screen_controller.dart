import 'package:booking_flights/ui/views/intro_view/intro_view.dart';
import 'package:booking_flights/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

import '../../shared/utilis.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 10)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(() => const IntroView());
      } else {
        Get.off(() => const LandingView());
      }
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}
