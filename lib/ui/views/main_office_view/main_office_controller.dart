import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainOfficeController extends GetxController {
  PageController controller = PageController(initialPage: 1);
  RxInt selectedIndex = 1.obs;
  MainOfficeController({required this.officeName, required this.officePhone});
  String officeName;
  String officePhone;
}
