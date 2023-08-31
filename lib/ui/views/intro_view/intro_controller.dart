import 'package:get/get.dart';

class IntroController extends GetxController {
  RxInt currentindex = 0.obs;
  List image = [
    'assets/images/aircraft.svg',
    'assets/images/flight_route.svg',
    'assets/images/suitcase.svg'
  ];
  List<String> titleList = ['Ticket booking', 'several destinations', 'Pack your bag'];
  List<String> descriptionList = [
    'The easiest way to book a ticket as soon as possible, wherever you are',
    
    'Many destinations can be chosen easily and quickly',
    'Pack your luggage and bags and book your ticket immediately through us'
  ];
  incrementIndex() {
    currentindex.value += 1;
  }
}
