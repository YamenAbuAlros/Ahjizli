import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/main_user_view/choose_seat_view/choose_seat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSeatView extends StatefulWidget {
  const ChooseSeatView(
      {super.key,
      required this.tripData,
      required this.keyTrip,
      this.passengerData});
  // ignore: prefer_typing_uninitialized_variables
  final passengerData, tripData, keyTrip;
  // final Map<String, dynamic> bookingInfo;

  @override
  State<ChooseSeatView> createState() => _ChooseSeatViewState();
}

class _ChooseSeatViewState extends State<ChooseSeatView> {
  late ChooseSeatController controller;
  @override
  void initState() {
    controller = Get.put(ChooseSeatController(
        widget.tripData, widget.keyTrip, widget.passengerData));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(top: width * 0.05),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.03),
              child: CustomText(
                  text: "Choose Seat As You Like",
                  fontsize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  textcolor: AppColors.mainGreen),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: controller.colorBusiness.value,
                          shape: const StadiumBorder()),
                      onPressed: () {
                        controller.setSeatType('Business');
                      },
                      child: CustomText(
                          text: 'Business',
                          textcolor: AppColors.mainBlack,
                          fontWeight: FontWeight.w500)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: controller.colorEconomy.value,
                          shape: const StadiumBorder()),
                      onPressed: () {
                        controller.setSeatType('Economy');
                      },
                      child: CustomText(
                          text: 'Economy',
                          textcolor: AppColors.mainBlack,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            (height * 0.03).sbheight,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Obx(() {
                  return GridView.count(
                    padding: EdgeInsetsDirectional.only(end: width * 0.04),
                    crossAxisSpacing: width * 0.001,
                    mainAxisSpacing: width * 0.01,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 5,
                    childAspectRatio: 2,
                    children: controller.seats1.entries.map((e) {
                      return InkWell(
                        onTap: e.value == 3
                            ? null
                            : () {
                                var seatPrice = controller.colorBusiness ==
                                        AppColors.mainGreen
                                    ? 4
                                    : 2;
                                Get.defaultDialog(
                                  title: "Alert",
                                  content: Center(
                                    child: Text(
                                        'The cost of this seat is $seatPrice dollars. Are you sure of the reservation?'),
                                  ),
                                  buttonColor: AppColors.mainGreen,
                                  cancel: CustomButton(
                                    text: "No",
                                    textColor: AppColors.mainWhite,
                                    paddingLR: width * 0.03,
                                    onPressed: () {
                                      controller.seats1[e.key] = 1;
                                      Get.back();
                                    },
                                    backgroundColor: AppColors.mainRedAcecnt,
                                  ),
                                  confirm: CustomButton(
                                    text: "Yes",
                                    textColor: AppColors.mainWhite,
                                    paddingLR: width * 0.03,
                                    backgroundColor: AppColors.mainGreen,
                                    onPressed: () {
                                      //* -- to complete payments--

                                      Get.back();
                                      controller.seats1[e.key] = 3;
                                      controller.seatSelected = e.key;

                                      customLoader();
                                      controller.updateSeats(
                                          controller.colorBusiness ==
                                                  AppColors.mainGreen
                                              ? 'Business'
                                              : 'Economy');

                                      //Get.to(page);
                                    },
                                  ),
                                );
                                // controller.seats1[e.key] = 2;
                              },
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Column(children: [
                            Container(
                              width: width * 0.12,
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                  color: e.value == 1
                                      ? AppColors.mainBlue1
                                      : e.value == 2
                                          ? AppColors.mainGreen
                                          : AppColors.mainRedAcecnt,
                                  // color: controller.toColor(e.value),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(width * 0.02))),
                              child: Center(child: Text(e.key)),
                            )
                          ]),
                        ),
                      );
                    }).toList(),
                  );
                })),
          
          ],
        ),
      )),
    );
  }
}
