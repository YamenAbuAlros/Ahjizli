// ignore_for_file: avoid_print

import 'dart:io';

import 'package:booking_flights/core/data/models/apis/booking_trip_model.dart';
import 'package:booking_flights/core/data/models/apis/new_trips_model.dart';
import 'package:booking_flights/core/enums/request_type.dart';
import 'package:booking_flights/core/utilis/network_utilis.dart';
import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/data/models/common_response.dart';
import '../../shared/colors.dart';
import '../../shared/utilis.dart';

class BookingRequestController extends GetxController {
  Map<String, NewTrips> tripsList = {};
  List<String> keyRequestList = [];

  RxList<BookingTrip> bookingRequests = <BookingTrip>[].obs;
  RxList isViewDetails = [].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    getAllTrips();
    getAllRequests();
    super.onInit();
  }

  void getAllRequests() async {
    isLoading.value = true;
    isViewDetails.clear();
    bookingRequests.clear();
    keyRequestList.clear();

    try {
      await NetworkUtil.sendRequest(
              type: RequestType.GET, url: 'BookingRequest.json')
          .then((respons) {
        isLoading.value = false;
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          commonResponse.data!.forEach((key, value) {
            var request = BookingTrip.fromJson(value);
            if (request.officeName == AirLinesData.selectedOfficeName) {
              bookingRequests.add(BookingTrip.fromJson(value));
              isViewDetails.add(false);
              keyRequestList.add(key);
            }
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void getAllTrips() async {
    try {
      await NetworkUtil.sendRequest(type: RequestType.GET, url: 'NewTrip.json')
          .then((respons) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          commonResponse.data!.forEach((key, value) {
            tripsList[key] = NewTrips.fromJson(value);
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  // void changeLocation(model, int index) {
  //   NetworkUtil.sendRequest(
  //       type: RequestType.DELETE,
  //       url: "BookingRequest/${keyRequestList[index]}.json");

  //   NetworkUtil.sendRequest(
  //       type: RequestType.POST,
  //       url: "CompletedBookingRequest.json",
  //       body: model.toJson());
  //   print(bookingRequests.removeAt(index));
  // }

  XFile? choosedImage;

  FilePickerResult? result;

  void showBottomSheetwithGetX(model, int index) {
    Get.bottomSheet(
      Wrap(
        children: [
          ListTile(
            onTap: () async {
              await pikFile(model, index);
            },
            leading: const Icon(Icons.photo),
            title: const Text("Gallery"),
          ),
        ],
      ),
      backgroundColor: AppColors.mainWhite,
    );
  }

  Future<void> pikFile(model, int index) async {
    customLoader();

    result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Get.back();
      customLoader();
      completeRequest(model, index);
      customLoader();
    }

    update();

    // Get.back();
  }

  void completeRequest(model, int index) {
    final ref = FirebaseStorage.instance.ref().child(model.firstname);

    ref.putFile(File(result!.paths[0]!)).then((p0) {
      ref.getDownloadURL().then((value) {
        NetworkUtil.sendRequest(
            type: RequestType.DELETE,
            url: "BookingRequest/${keyRequestList[index]}.json");
        model.url = value;
        model.refname = ref.name;
        NetworkUtil.sendRequest(
            type: RequestType.POST,
            url: "CompletedBookingRequest.json",
            body: model.toJson());
        sendSms(bookingRequests[index].phone!,
            "Your reservation has been completed and thank you for trusting us\n ${AirLinesData.selectedOfficeName}");
        print(bookingRequests.removeAt(index));
        BotToast.closeAllLoading();
      });
    });
  }
}
