import 'package:booking_flights/core/data/models/apis/new_trips_model.dart';
import 'package:booking_flights/core/enums/request_type.dart';
import 'package:booking_flights/core/utilis/network_utilis.dart';
import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/views/main_user_view/payments_view/payment_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSeatController extends GetxController {
  Rx<Color> colorEconomy = AppColors.mainWhite.obs;
  Rx<Color> colorBusiness = AppColors.mainGreen.obs;

  String seatSelected = '', keyTrip;
  Map<dynamic, dynamic> businessSeats = {};
  Map<dynamic, dynamic> economySeats = {};
  NewTrips tripData;
  Map<String, dynamic> passengerData;
  RxMap<dynamic, dynamic> seats1 = {}.obs;

  ChooseSeatController(this.tripData, this.keyTrip, this.passengerData) {
    businessSeats = tripData.businessSeats!;
    economySeats = tripData.economySeats!;
    seats1.clear();
    seats1.addAll(businessSeats);
  }

  Color toColor(String value) {
    String valueString = value.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value1 = int.parse(valueString, radix: 16);
    Color otherColor = Color(value1);
    return otherColor;
  }

  void setSeatType(String seatType) {
    if (seatType == 'Business') {
      seats1.clear();
      seats1.addAll(businessSeats);
      colorBusiness.value = AppColors.mainGreen;
      colorEconomy.value = AppColors.mainWhite;
    } else {
      seats1.clear();
      seats1.addAll(economySeats);
      colorBusiness.value = AppColors.mainWhite;
      colorEconomy.value = AppColors.mainGreen;
    }
  }

//* this func will update business and economy seats in firebase and update passenger data by add seat's number and Price
//* and after that will close Loader and Go To payment view
  void updateSeats(String seatType) {
    passengerData['seat'] = seatSelected;      passengerData['TripId'] = keyTrip;
    passengerData['OfficeName']=tripData.officeName;

    if (seatType == 'Business') {
      passengerData['price'] = (int.parse(tripData.price!) + 4.0).toString();
      businessSeats[seatSelected] = 3;
    } else {
      passengerData['price'] = (int.parse(tripData.price!) + 2.0).toString();
      economySeats[seatSelected] = 3;
    }
    var body = {
      'BusinessSeats': businessSeats,
      'EconomySeats': economySeats,
      "Round": tripData.round.toString(),
      "From": tripData.from.toString(),
      "To": tripData.to.toString(),
      "Price": tripData.price.toString(),
      "Airline": tripData.airline.toString(),
      "Go To Date": tripData.goToDate.toString(),
      "Go To Leave": tripData.goToLeave.toString(),
      "Go To Come": tripData.goToCome.toString(),
      "Back Date": tripData.backDate.toString(),
      "Back Leave": tripData.backLeave.toString(),
      "Back Come": tripData.backCome.toString(),
      "OfficeName":tripData.officeName.toString(),
    };
    NetworkUtil.sendRequest(
            type: RequestType.PUT, url: 'NewTrip/$keyTrip.json', body: body)
        .then((value) {
      BotToast.closeAllLoading();

      Get.off(() => PaymentView(
            keyTrip: keyTrip,
            passengerData: passengerData,
          ));
    });
  }
}
