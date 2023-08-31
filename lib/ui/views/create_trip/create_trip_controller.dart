import 'package:booking_flights/core/enums/message_type.dart';
import 'package:booking_flights/core/enums/request_type.dart';
import 'package:booking_flights/core/utilis/network_utilis.dart';
import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_showtoast.dart';
import 'package:booking_flights/ui/views/show_trip/show_trip.dart';
import 'package:booking_flights/ui/views/show_trip/show_trip_controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTripController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController destinationController = TextEditingController(),
      fromController = TextEditingController(),
      priceController = TextEditingController(),
      goDateController = TextEditingController(),
      selectedDateController = TextEditingController(),
      selectedDate1Controller = TextEditingController(),
      leaveTimeController = TextEditingController(),
      comeTimeController = TextEditingController(),
      leaveTime1Controller = TextEditingController(),
      comeTime1Controller = TextEditingController();

  Rx<Color> colorRound = AppColors.mainWhite1.obs;
  Rx<Color> colorOneWay = AppColors.mainGreen.obs;

  RxBool selectedRound = false.obs;
  RxBool selectedOne = false.obs;

  void addNewTrip(Map<String, dynamic> body) async {
    await NetworkUtil.sendRequest(
            type: RequestType.POST, url: "NewTrip.json", body: body)
        .then((value) {
      BotToast.closeAllLoading();
      CustomShowToast.showMessage(
          message: "The flight has been added successfully",
          messageType: MessageType.SUCCESS);
      
      destinationController.text = '';
      fromController.text = '';
      priceController.text = '';
      goDateController.text = '';
      selectedDate1Controller.text = '';
      selectedDateController.text = '';
      leaveTime1Controller.text = '';
      leaveTimeController.text = '';
      comeTime1Controller.text = '';
      comeTimeController.text = '';
      // Future.delayed(const Duration(seconds: 5)).whenComplete(() => Get.to(() => const ShowTrips()));
    });
  }

  void setTripType(String type) {
    if (type == 'Round') {
      colorRound.value = AppColors.mainGreen;
      colorOneWay.value = AppColors.mainWhite1;
      selectedRound.value = true;
      selectedOne.value = false;
    } else {
      colorRound.value = AppColors.mainWhite1;
      colorOneWay.value = AppColors.mainGreen;
      selectedRound.value = false;
      selectedOne.value = true;
    }
  }
}
