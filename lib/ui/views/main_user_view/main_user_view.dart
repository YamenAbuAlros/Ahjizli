import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/views/main_user_view/book_trip/book_trip_view.dart';
import 'package:booking_flights/ui/views/main_user_view/main_user_controller.dart';
import 'package:booking_flights/ui/views/main_user_view/my_trip_view/my_trip_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainUserView extends StatefulWidget {
  const MainUserView({super.key});

  @override
  State<MainUserView> createState() => _MainUserViewState();
}

class _MainUserViewState extends State<MainUserView> {
  MainUserController controller = Get.put(MainUserController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.controller,
            children: const [BookTrip(), MyTripsView()]),
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
              text: 'Booking Trips',
            ),
            GButton(
              icon: Icons.flight_takeoff_outlined,
              text: 'MyTrips',
            ),
          ],
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.onChanged(index);
          },
        ),
      ),
    );
  }
}
