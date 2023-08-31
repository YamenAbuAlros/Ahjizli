import 'package:booking_flights/core/data/models/apis/booking_trip_model.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/data/models/common_response.dart';
import '../../../../core/enums/request_type.dart';
import '../../../../core/utilis/network_utilis.dart';

class MyTripController extends GetxController {
  List mytrips = [];
  var myTripData = {};
  Map<String, dynamic> myInfo = {};
  String firstName = '', lastName = '', url = '', refname = '';
  bool isChecked = false;
  bool isLoading = false;

  @override
  void onInit() {
    isChecked = false;
    mytrips.clear();
    mytrips.addAll(storage.getMyTrips());
    // mytrips.value = storage.getMyTrips();
    updateMyTrips();
    super.onInit();
  }

  Future<void> updateMyTrips() async {
    if (mytrips.isNotEmpty) {
      myTripData.clear();
      isLoading = true;
      for (var element in mytrips) {
        var split = element.split(':');
        myInfo[split.first] = split.last;
      }
      var tripid = myInfo['TripId'];
      firstName = myInfo['Firstname'];
      lastName = myInfo['Lastname'];
      await NetworkUtil.sendRequest(
              type: RequestType.GET, url: 'NewTrip/$tripid.json')
          .then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getstatus) {
          // myTripData.addAll(NewTrips.fromJson(commonResponse.data!));
          commonResponse.data!.forEach((key, value) {
            myTripData[key] = value;
          });
        }
        checkStateRequest();
        // deleteMyTrips(tripid);
        update();
      });
    }
  }

  Future<void> checkStateRequest() async {
    try {
      await NetworkUtil.sendRequest(
              type: RequestType.GET, url: 'CompletedBookingRequest.json')
          .then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);
        if (commonResponse.getstatus) {
          commonResponse.data!.forEach((key, value) {
            if (BookingTrip.fromJson(value).firstname == firstName &&
                BookingTrip.fromJson(value).lastname == lastName) {
              isChecked = true;
              url = BookingTrip.fromJson(value).url!;
              refname = BookingTrip.fromJson(value).refname!;
            }
          });
          isLoading = false;
        }
      });
    } catch (e) {
      print(e.toString());
      isLoading = false;
    }

    update();
  }

  Future download() async {
    customLoader();
    final dir = await getExternalStorageDirectory();
    print(dir);

    // new Directory(dir.path + '/' + 'dir')
    //     .create(recursive: true)
    //     .then((Directory directory) {
    //   print('Path of New Dir: ' + directory.path);

    try {
      final path = "${dir!.path}/$firstName.jpg";
      await Dio().download(url, path);
      // await GallerySaver.saveImage(path, toDcim: true);
      BotToast.closeAllLoading();
      Get.snackbar('DownLoad', 'Successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      BotToast.closeAllLoading();
    }

    // Future<void> deleteMyTrips(String tripid) async {
    //   var date = myTripData['Go To Date'].split('-');
    //   print(date);

    //   if (DateTime.now().isAfter(
    //       DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2])))) {
    //     await NetworkUtil.sendRequest(
    //       type: RequestType.DELETE,
    //       url: 'NewTrip/$tripid.json',
    //     );
    //   }
    //   update();
    // }
  }
}
