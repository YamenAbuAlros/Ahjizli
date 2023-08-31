import 'package:booking_flights/core/data/models/apis/new_trips_model.dart';
import 'package:booking_flights/core/data/models/common_response.dart';
import 'package:booking_flights/core/enums/request_type.dart';
import 'package:booking_flights/core/utilis/network_utilis.dart';
import 'package:booking_flights/ui/views/main_user_view/complete_book_view/complete_book_view.dart';
import 'package:get/get.dart';

class BookTripController extends GetxController {
  RxList<NewTrips> tripsList = <NewTrips>[].obs;
  List<String> keyTripList = [];
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getAllTrips();
    super.onInit();
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
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          commonResponse.data!.forEach((key, value) {
            keyTripList.add(key);
            tripsList.add(NewTrips.fromJson(value));
          });
        }
        isLoading.value = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  void bookTrip(tripData, key) {
    Get.to(() => CompleteBooking(
          keytrip: key,
          flightData: tripData,
        ));
  }
}
