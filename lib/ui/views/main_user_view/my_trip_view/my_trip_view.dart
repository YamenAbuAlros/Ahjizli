import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/main_user_view/my_trip_view/my_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';

class MyTripsView extends StatefulWidget {
  const MyTripsView({super.key});

  @override
  State<MyTripsView> createState() => _MyTripsViewState();
}

class _MyTripsViewState extends State<MyTripsView> {
  MyTripController controller = Get.put(MyTripController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Column(
      children: [
        GetBuilder(
          init: MyTripController(),
          builder: (controller) {
            // MyTripController().onInit();
            return controller.isLoading
                ? Center(
                    child: SpinKitCircle(
                      color: AppColors.mainRedAcecnt,
                    ),
                  )
                : controller.myTripData.isNotEmpty
                    ? Column(
                        children: [
                          Card(
                            color: AppColors.mainBlue3,
                            margin: EdgeInsetsDirectional.only(
                                top: width * 0.06,
                                end: width * 0.05,
                                start: width * 0.05),
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: width * 0.04, end: width * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          textcolor: AppColors.mainBlue2,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myInfo['Address']}: ${controller.myInfo['Firstname']} ${controller.myInfo['Lastname']} "),
                                      controller.isChecked
                                          ? SvgPicture.asset(
                                              'assets/images/success.svg',
                                              width: width * 0.1,
                                            )
                                          : SvgPicture.asset(
                                              'assets/images/warning.svg')
                                    ],
                                  ),

                                  (height * 0.02).sbheight,

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: "DateOfBirth:"),
                                      CustomText(
                                          textcolor: AppColors.mainBlue1,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myInfo['DateOfBirth']}"),
                                    ],
                                  ),
                                  (height * 0.02).sbheight,

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: "Nationality:"),
                                      CustomText(
                                          textcolor: AppColors.mainBlue1,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myInfo['Nationality']}"),
                                    ],
                                  ),
                                  (height * 0.02).sbheight,

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: "PassportNumber:"),
                                      CustomText(
                                          textcolor: AppColors.mainBlue1,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myInfo['PassportNumber']}"),
                                    ],
                                  ),
                                  (height * 0.02).sbheight,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: "PassportExpiryDate: "),
                                      CustomText(
                                          textcolor: AppColors.mainBlue1,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myInfo['ExpiryDate']}"),
                                    ],
                                  ),
                                  (height * 0.02).sbheight,

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: "Phone:"),
                                      CustomText(
                                          textcolor: AppColors.mainBlue1,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myInfo['Phone']!}"),
                                    ],
                                  ),
                                  (height * 0.02).sbheight,

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                          textcolor: AppColors.mainGreen,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text:
                                              "${controller.myTripData['From']}"),
                                      SvgPicture.asset(
                                          'assets/images/plane.svg'),
                                      CustomText(
                                          textcolor: AppColors.mainRedAcecnt,
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: controller.myTripData['To']
                                              .toString()),
                                    ],
                                  ),
                                  (height * 0.02).sbheight,

                                  Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        vertical: height * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.arrow_upward),
                                        Center(
                                          child: CustomText(
                                              fontsize: width * 0.04,
                                              fontWeight: FontWeight.w500,
                                              text: controller
                                                  .myTripData['Go To Date']
                                                  .toString()),
                                        ),
                                        CustomText(
                                            textcolor: AppColors.mainGreen,
                                            fontsize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            text: controller
                                                .myTripData['Go To Leave']
                                                .toString()),
                                        CustomText(
                                            textcolor: AppColors.mainRedAcecnt,
                                            fontsize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            text: controller
                                                .myTripData['Go To Come']
                                                .toString())
                                      ],
                                    ),
                                  ),
                                  (height * 0.02).sbheight,

                                  Visibility(
                                    visible: controller.myTripData['Back Date']
                                            .toString() !=
                                        "null",
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.arrow_downward),
                                        Center(
                                            child: CustomText(
                                          fontsize: width * 0.04,
                                          fontWeight: FontWeight.w500,
                                          text: controller
                                              .myTripData['Back Date']
                                              .toString(),
                                        )),
                                        CustomText(
                                            textcolor: AppColors.mainRedAcecnt,
                                            fontsize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            text: controller
                                                .myTripData['Back Leave']
                                                .toString()),
                                        CustomText(
                                            textcolor: AppColors.mainGreen,
                                            fontsize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            text: controller
                                                .myTripData['Back Come']
                                                .toString())
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        vertical: height * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        // Center(
                                        //   child: CustomText(
                                        //       fontsize: width * 0.04,
                                        //       fontWeight: FontWeight.w500,
                                        //       text: controller.bookingRequests[index].seat!),
                                        // ),
                                        // CustomText(
                                        //     textcolor: AppColors.mainRedAcecnt,
                                        //     fontsize: width * 0.04,
                                        //     fontWeight: FontWeight.w500,
                                        //     text:
                                        //         "${controller.bookingRequests[index].price!} \$"),
                                      ],
                                    ),
                                  ),
                                  // CustomButton(
                                  //   text: "Confirm This reservation",
                                  //   textColor: AppColors.mainWhite,
                                  //   paddingLR: width * 0.02,
                                  //   backgroundColor: AppColors.mainRedAcecnt,
                                  //   onPressed: () {
                                  //     sendSms(controller.bookingRequests[index].phone!,
                                  //         "Your reservation has been completed and thank you for trusting us\n fast travel");
                                  //     // controller.changeLocation(
                                  //     //     controller
                                  //     //         .bookingRequests[index],
                                  //     //     index);
                                  //   },
                                  // )
                                ],
                              ),
                            ),
                          ),
                          (width * 0.1).sbheight,
                          controller.isChecked
                              ? CustomButton(onPressed: controller.download,
                                  text: 'DownLoad Your Ticket',
                                  textColor: AppColors.mainWhite,
                                  backgroundColor: AppColors.mainGreen,
                                  paddingLR: width * 0.02)
                              : (width * 0.02).sbheight,
                        ],
                      )
                    : const Center(
                        child: CustomText(text: 'No Trips'),
                      );
          },
        ),
      ],
    );
  }
}
