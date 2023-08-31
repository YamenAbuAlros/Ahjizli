import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/views/booking_requet_view/booking_request_view.dart';
import 'package:booking_flights/ui/views/create_trip/create_trip.dart';
import 'package:booking_flights/ui/views/main_office_view/main_office_controller.dart';
import 'package:booking_flights/ui/views/show_trip/show_trip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainOfficeView extends StatefulWidget {
  const MainOfficeView({super.key, required this.officeName, required this.officePhone});
final String officeName,officePhone;
  @override
  State<MainOfficeView> createState() => _MainOfficeViewState();
}

class _MainOfficeViewState extends State<MainOfficeView> {
  late MainOfficeController controller;

  @override
  void initState() {
    controller = Get.put(MainOfficeController(officeName: widget.officeName,officePhone: widget.officePhone));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.controller,
          children: const [CreateTrip(), ShowTrips(), BookingRequestView()],
        ),
        bottomNavigationBar: GNav(
          backgroundColor: AppColors.mainBlue1,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: AppColors.mainBlue2,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Create Trips',
            ),
            GButton(
              icon: Icons.trip_origin,
              text: 'Available Trips',
            ),
            GButton(
              icon: Icons.airplane_ticket,
              text: 'Booking Request',
            ),
          ],
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.selectedIndex.value = index;
            controller.controller.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
