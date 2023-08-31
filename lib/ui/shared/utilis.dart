import 'package:booking_flights/core/enums/message_type.dart';
import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/data/repositories/shared_prefernce_repo.dart';

bool checkEmail(String value) {
  RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return regExp.hasMatch(value);
}

bool validatePassword(String value) {
  RegExp passValid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return passValid.hasMatch(value);
}

bool isPrice(String value) {
  RegExp passValid = RegExp(r'^\d{0,8}(\.\d{1,4})?$');
  return passValid.hasMatch(value);
}

bool isName(String value) {
  RegExp nameValid = RegExp(r"^[A-Za-z]+$");
  return nameValid.hasMatch(value);
}

bool isNumber(String value) {
  RegExp numberValid = RegExp(r"^(?:[+0]9)?[0-9]{8}$");
  return numberValid.hasMatch(value);
}

double get width => Get.width;
double get height => Get.height;

SharedPreferenceRepositories get storage =>
    Get.find<SharedPreferenceRepositories>();
AirLinesData get airLinesData => Get.find<AirLinesData>();

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: width * 0.2,
        height: width * 0.2,
        child: SpinKitCircle(
          color: AppColors.mainGreen,
          size: width * 0.2,
        ),
      );
    });

sendSms(String path, String body) async {
  final Uri smsLaunchUri = Uri.parse('sms:$path?body=$body');

  if (await canLaunchUrl(smsLaunchUri)) {
    launchUrl(smsLaunchUri);
  } else {
    CustomShowToast.showMessage(
        message: 'Could not launch $smsLaunchUri',
        messageType: MessageType.REJECTED);
  }
}
