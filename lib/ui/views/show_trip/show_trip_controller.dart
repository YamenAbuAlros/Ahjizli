// ignore_for_file: avoid_print

import 'package:booking_flights/core/data/models/apis/new_trips_model.dart';
import 'package:booking_flights/core/data/models/common_response.dart';
import 'package:booking_flights/core/enums/request_type.dart';
import 'package:booking_flights/core/utilis/network_utilis.dart';
import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
import 'package:get/get.dart';

class ShowTripController extends GetxController {
  RxList<NewTrips> tripsList = <NewTrips>[].obs;
  List<String> keyTripList = [];
  RxBool isLoading = true.obs;
  bool isOninitCalled = true;

  @override
  void onInit() {
    getAllTrips();
    super.onInit();
  }

  @override
  void onClose() {
    isOninitCalled = true;
    super.onClose();
  }

  void getAllTrips() async {
    tripsList.clear();
    keyTripList.clear();
    isLoading.value = true;
    try {
      await NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: "NewTrip.json",
      ).then((respons) {
        isLoading.value = false;
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          commonResponse.data!.forEach((key, value) {
            var date = NewTrips.fromJson(value).goToDate!.split("-");
      isOninitCalled = false;

            if (DateTime.now().isAfter(DateTime(
                int.parse(date[0]), int.parse(date[1]), int.parse(date[2])))) {
              deleteTrip(key);
            } else {
              var trip = NewTrips.fromJson(value);
              if (trip.officeName == AirLinesData.selectedOfficeName) {
                keyTripList.add(key);
                tripsList.add(NewTrips.fromJson(value));
              }
            }
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteTrip(keyTrip) async {
    await NetworkUtil.sendRequest(
      type: RequestType.DELETE,
      url: 'NewTrip/$keyTrip.json',
    );
  }
}
