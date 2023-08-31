// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:booking_flights/core/enums/request_type.dart';
import 'package:booking_flights/core/utilis/network_utilis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CompleteBookController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String keyTrip;
  CompleteBookController(this.flightData, this.keyTrip);
  var flightData;
  TextEditingController addressController = TextEditingController(),
      firstnameController = TextEditingController(),
      lastnameController = TextEditingController(),
      genderController = TextEditingController(),
      nationalityController = TextEditingController(),
      passportNumberController = TextEditingController(),
      countryController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController();

  var dateController = TextEditingController().obs;
  var expiryController = TextEditingController().obs;

  String? address, gender, nationality, countryIssue;
  List<String> addressList = ['Mr', 'Ms'], genderList = ['male', 'female'];
  Map<String, String> nationalityList = {
    'Bahrain': 'Bahraini',
    'Kuwait': 'Kuwaiti',
    'Iraq': 'Iraqi',
    'Iran': 'Iranian',
    'Jordan': 'Jordanian',
    'Libya': 'Libyan',
    'Lebanon': 'Lebanese',
    'Malaysia': 'Malaysian',
    'Maldives': 'Maldivian',
    'Oman': 'Omani',
    'Russia': 'Russian',
    'Saudi Arabia': 'Saudi',
    'Syria': 'Syrian',
    'Tunisia': 'Tunisian',
    'Sudan': 'Sudanese',
    'United Arab Emirates': 'Emirati',
    'Yemen': 'Yemeni',
    'Morocco': 'Moroccan',
    'India': 'Indian',
    'Egypt': 'Egyptian',
    'China': 'Chinese',
  };
  void datePicker(TextEditingController variable) {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(DateTime.now().year + 6, DateTime.now().month,
                DateTime.now().day))
        .then((value) {
      if (value != null) {
        variable.text = DateFormat('yyyy-MM-dd').format(value);
      }
    });
  }

  void bookTrip(Map<String, dynamic> body) async {
    await NetworkUtil.sendRequest(
        type: RequestType.POST, url: "bookingtrip.json", body: body);
  }
}
