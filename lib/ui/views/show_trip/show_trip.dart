import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/show_trip/show_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShowTrips extends StatefulWidget {
  const ShowTrips({super.key});
  @override
  State<ShowTrips> createState() => _ShowTripsState();
}

class _ShowTripsState extends State<ShowTrips> {

  @override
  Widget build(BuildContext context) {
      ShowTripController controller = Get.put(ShowTripController());

     controller.isOninitCalled? null:controller.onInit();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Available',
                      style: TextStyle(
                          color: AppColors.mainGreen,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: ' Flights',
                          style: TextStyle(
                              fontSize: 30,
                              color: AppColors.mainHntaoe,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                SizedBox(
                  height: width * 0.04,
                ),
                Center(
                  child: Obx(
                    () => controller.isLoading.value
                        ? SpinKitDualRing(
                            color: AppColors.mainGreen,
                          )
                        : controller.tripsList.isNotEmpty
                            ? ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.05),
                                    width: width * 0.9,
                                    height: height * 0.4,
                                    decoration: BoxDecoration(
                                        color: AppColors.mainBlue3,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.05)),
                                    child: Padding(
                                      padding: EdgeInsets.all(width * 0.05),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/${controller.tripsList[index].airline}.png",
                                                width: width * 0.07,
                                              ),
                                              (width * 0.03).sbwidth,
                                              CustomText(
                                                  text:
                                                      '${controller.tripsList[index].airline}'),
                                              const Spacer(),
                                              CustomText(
                                                text:
                                                    '${controller.tripsList[index].price}\$',
                                                textcolor: AppColors.mainBlue1,
                                                fontsize: width * 0.05,
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CustomText(
                                                  text:
                                                      '${controller.tripsList[index].goToLeave}'),
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        AppColors.mainWhite1),
                                                width: width * 0.03,
                                                height: width * 0.03,
                                              ),
                                              CustomText(
                                                  text: '----',
                                                  fontsize: width * 0.1,
                                                  fontWeight: FontWeight.w100),
                                              SvgPicture.asset(
                                                  'assets/images/plane.svg'),
                                              CustomText(
                                                  text: '----',
                                                  fontsize: width * 0.1,
                                                  fontWeight: FontWeight.w100),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainBlue2,
                                                  shape: BoxShape.circle,
                                                ),
                                                width: width * 0.03,
                                                height: width * 0.03,
                                              ),
                                              CustomText(
                                                  text:
                                                      '${controller.tripsList[index].goToCome}'),
                                            ],
                                          ),
                                          Row(children: [
                                            SizedBox(
                                              width: width * 0.03,
                                            ),
                                            Column(
                                              children: [
                                                CustomText(
                                                    text:
                                                        "${controller.tripsList[index].from}"),
                                                //CustomText("${controller.tripsList[index].to}"),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                CustomText(
                                                    text:
                                                        "${controller.tripsList[index].to}"),
                                                //CustomText(""),
                                                // constCustomText('Dubi'),
                                              ],
                                            ),
                                            SizedBox(
                                              width: width * 0.03,
                                            )
                                          ]),
                                          controller.tripsList[index].round !=
                                                  "true"
                                              ? CustomText(
                                                  text:
                                                      '-------------------------',
                                                  fontsize: width * 0.07,
                                                  fontWeight: FontWeight.w100)
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    CustomText(
                                                        text:
                                                            '${controller.tripsList[index].goToLeave}'),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .mainBlue2),
                                                      width: width * 0.03,
                                                      height: width * 0.03,
                                                    ),
                                                    CustomText(
                                                        text: '----',
                                                        fontsize: width * 0.1,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                    // SvgPicture.asset(
                                                    //     'assets/images/plane.svg'),
                                                    Image.asset(
                                                        "assets/images/airplane_Round.png",
                                                        width: width * 0.06),
                                                    CustomText(
                                                        text: '----',
                                                        fontsize: width * 0.1,
                                                        fontWeight:
                                                            FontWeight.w100),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .mainWhite1,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      width: width * 0.03,
                                                      height: width * 0.03,
                                                    ),
                                                    CustomText(
                                                        text:
                                                            '${controller.tripsList[index].goToCome}'),
                                                  ],
                                                ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: width * 0.35,
                                                height: width * 0.1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.2),
                                                    color: Colors.white38),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                        Icons.arrow_upward),
                                                    // SvgPicture.asset(
                                                    //   'assets/images/date.svg',
                                                    //   width: width * 0.06,
                                                    // ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    CustomText(
                                                        text:
                                                            "${controller.tripsList[index].goToDate}"),

                                                    // constCustomText(""),
                                                  ],
                                                ),
                                              ),
                                              if (controller
                                                      .tripsList[index].round ==
                                                  "true")
                                                Container(
                                                  width: width * 0.35,
                                                  height: width * 0.1,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width * 0.2),
                                                      color: Colors.white38),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                          Icons.arrow_downward),
                                                      // SvgPicture.asset(
                                                      //     'assets/images/time.svg'),
                                                      SizedBox(
                                                        width: width * 0.02,
                                                      ),
                                                      CustomText(
                                                          text:
                                                              "${controller.tripsList[index].backDate}"),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          CustomButton(
                                            text: "Delete",
                                            textColor: AppColors.mainWhite,
                                            paddingLR: width * 0.07,
                                            backgroundColor:
                                                AppColors.mainRedAcecnt,
                                            onPressed: () {
                                              controller.deleteTrip(controller
                                                  .keyTripList[index]);
                                              controller.tripsList.remove(
                                                  controller.tripsList[index]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: controller.tripsList.length,
                                separatorBuilder: (context, index) => Divider(
                                  height: height * 0.1,
                                  color: AppColors.mainBlack,
                                ),
                              )
                            : const Center(
                                child: CustomText(text: "No Trip Available")),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
