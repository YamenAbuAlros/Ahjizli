import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainUserController extends GetxController {
  PageController controller = PageController(initialPage: 0);
  RxInt selectedIndex = 0.obs;
 
  void onChanged(int index) {
    selectedIndex.value = index;
    controller.jumpToPage(index);
  }
}
