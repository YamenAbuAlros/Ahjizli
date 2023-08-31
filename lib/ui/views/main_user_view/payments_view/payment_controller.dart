// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:booking_flights/ui/views/main_user_view/my_trip_view/my_trip_controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/enums/request_type.dart';
import '../../../../core/utilis/network_utilis.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/utilis.dart';

class PaymentController {
  TextEditingController noticeId = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  Map<String, dynamic> passengerDate;
  var keyTrip;
  List<String> listStoreInSharedRepo = [];
  PaymentController(this.passengerDate, this.keyTrip);
  void saveInDataBase() {
    customLoader();
    passengerDate['NoticeId'] = noticeId.text;
    NetworkUtil.sendRequest(
            type: RequestType.POST,
            url: 'BookingRequest.json',
            body: passengerDate)
        .then((value) {
      passengerDate.forEach((key, value) {
        listStoreInSharedRepo.add('$key:$value');
      });
      storage.setMyTrips(listStoreInSharedRepo);
      BotToast.closeAllLoading();
      Get.defaultDialog(
          title: "Alert",
          content: const Center(
            child: Text(
                'The information will be verified and you will be notified of the result of the reservation on the phone number'),
          ),
          buttonColor: AppColors.mainGreen,
          cancel: CustomButton(
            onPressed: () {
              // MyTripController();
              // MainUserController().selectedIndex.value = 1;
              // Get.to(const MainUserView());
              // MyTripController().onInit();  
              Get.back();
              Get.back();
            },
            text: "ok",
            textColor: AppColors.mainWhite,
            paddingLR: width * 0.02,
            backgroundColor: AppColors.mainGreen,
          ));
    });
  }
}
