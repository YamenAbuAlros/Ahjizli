import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/common_response.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/enums/request_type.dart';
import '../../../core/utilis/network_utilis.dart';
import '../../shared/custom_widgets/custom_showtoast.dart';
import '../main_office_view/main_office_view.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    getOfficeData();
    super.onInit();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void checkLogin() {
    if (formKey.currentState!.validate()) {
      while (AirLinesData.officeData.isEmpty) {}
      bool isOffice = false;
      AirLinesData.officeData.forEach((key, value) {
        if (emailController.text == value['Email'] &&
            passwordController.text == value['Password']) {
          AirLinesData.selectedOfficeName = value['Name'];
          AirLinesData.selectedOfficePhone = value['PhoneNumber'];
          Get.to(MainOfficeView(
              officeName: value['Name'], officePhone: value['PhoneNumber']));
          isOffice = true;
        }
      });
      if (!isOffice) {
        CustomShowToast.showMessage(
            message: 'You are not authorized to enter',
            messageType: MessageType.REJECTED);
      }
    }
  }

  Future<void> getOfficeData() async {
    try {
      await NetworkUtil.sendRequest(
              type: RequestType.GET, url: 'OfficeData.json')
          .then((respons) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(respons);
        if (commonResponse.getstatus) {
          commonResponse.data!.forEach((key, value) {
            AirLinesData.officeData[key] = value;
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}









// import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../core/data/models/common_response.dart';
// import '../../../core/enums/message_type.dart';
// import '../../../core/enums/request_type.dart';
// import '../../../core/utilis/network_utilis.dart';
// import '../../shared/custom_widgets/custom_showtoast.dart';
// import '../main_office_view/main_office_view.dart';

// class LoginController extends GetxController {
//   @override
//   void onInit() {
//     getOfficeData();
//     super.onInit();
//   }

//   TextEditingController emailController =
//       TextEditingController(text: 'MainOfficeTest@gmail.com');
//   TextEditingController passwordController =
//       TextEditingController(text: 'MainOfficeTest5355***');
//   final formKey = GlobalKey<FormState>();
//   void checkLogin() {
//     if (formKey.currentState!.validate()) {
//       while (AirLinesData.officeData.isEmpty) {}
//       if (emailController.text == AirLinesData.officeData['Email'] &&
//           passwordController.text == AirLinesData.officeData['Password']) {
//         Get.to(const MainOfficeView());
//       } else {
//         CustomShowToast.showMessage(
//             message: 'You are not authorized to enter',
//             messageType: MessageType.REJECTED);
//       }
//     }
//   }

//   Future<void> getOfficeData() async {
//     await NetworkUtil.sendRequest(type: RequestType.GET, url: 'OfficeData.json')
//         .then((respons) {
//       CommonResponse<Map<String, dynamic>> commonResponse =
//           CommonResponse.fromJson(respons);
//       if (commonResponse.getstatus) {
//         commonResponse.data!.forEach((key, value) {
//           AirLinesData.officeData[key] = value;
//         });
//       }
//     });
//   }
// }