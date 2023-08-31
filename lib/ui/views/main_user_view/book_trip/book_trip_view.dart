import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/main_user_view/book_trip/book_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookTrip extends StatefulWidget {
  const BookTrip({super.key});

  @override
  State<BookTrip> createState() => _BookTripState();
}

class _BookTripState extends State<BookTrip> {
  BookTripController controller = Get.put(BookTripController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                                  borderRadius:
                                      BorderRadius.circular(width * 0.05)),
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
                                        (width * 0.015).sbwidth,
                                        CustomText(
                                            text:
                                                '${controller.tripsList[index].airline}'),
                                        (width * 0.05).sbwidth,
                                        CustomText(
                                          text:
                                              "${controller.tripsList[index].officeName}",
                                          textcolor: AppColors.mainOrange,
                                          fontsize: width * 0.03,
                                        ),
                                        const Spacer(),
                                        // (width * 0.03).sbwidth,
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
                                              color: AppColors.mainWhite1),
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
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          CustomText(
                                              text:
                                                  "${controller.tripsList[index].to}"),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      )
                                    ]),
                                    controller.tripsList[index].round != "true"
                                        ? CustomText(
                                            text: '-------------------------',
                                            fontsize: width * 0.07,
                                            fontWeight: FontWeight.w100)
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CustomText(
                                                  text:
                                                      '${controller.tripsList[index].goToLeave}'),
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.mainBlue2),
                                                width: width * 0.03,
                                                height: width * 0.03,
                                              ),
                                              CustomText(
                                                  text: '----',
                                                  fontsize: width * 0.1,
                                                  fontWeight: FontWeight.w100),
                                              Image.asset(
                                                  "assets/images/airplane_Round.png",
                                                  width: width * 0.06),
                                              CustomText(
                                                  text: '----',
                                                  fontsize: width * 0.1,
                                                  fontWeight: FontWeight.w100),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.mainWhite1,
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
                                              const Icon(Icons.arrow_upward),

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
                                        if (controller.tripsList[index].round ==
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
                                                  MainAxisAlignment.center,
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
                                      text: "Book",
                                      textColor: AppColors.mainWhite,
                                      paddingLR: width * 0.07,
                                      backgroundColor: AppColors.mainGreen,
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Alert",
                                          titleStyle:
                                              const TextStyle(fontSize: 25),
                                          middleText: "This is middle text",
                                          middleTextStyle:
                                              const TextStyle(fontSize: 20),
                                          backgroundColor: AppColors.mainWhite,
                                          content: const Text(
                                              'Do you want to continue booking?'),
                                          onCancel: () {},
                                          onConfirm: () {},
                                          buttonColor: AppColors.mainGreen,
                                          cancel: CustomButton(
                                            text: 'Cancel',
                                            textColor: AppColors.mainWhite,
                                            paddingLR: width * 0.01,
                                            onPressed: () {
                                              Get.back();
                                            },
                                            backgroundColor:
                                                AppColors.mainRedAcecnt,
                                          ),
                                          //  InkWell(
                                          //   onTap: () {
                                          //     Get.back();
                                          //   },
                                          //   child: Text(
                                          //     "Cancel",
                                          //     style: TextStyle(
                                          //         color: AppColors
                                          //             .mainRedAcecnt),
                                          //   ),
                                          // ),
                                          confirm: CustomButton(
                                            text: 'Confirm',
                                            textColor: AppColors.mainWhite,
                                            paddingLR: width * 0.01,
                                            onPressed: () {
                                              Get.back();
                                              controller.bookTrip(
                                                  controller.tripsList[index],
                                                  controller
                                                      .keyTripList[index]);
                                            },
                                            backgroundColor:
                                                AppColors.mainGreen,
                                          ),
                                          // InkWell(
                                          //   onTap: () {
                                          //     controller.bookTrip(
                                          //         controller
                                          //             .tripsList[index]);
                                          //   },
                                          //   child: Text(
                                          //     "Confirm",
                                          //     style: TextStyle(
                                          //         color: AppColors
                                          //             .mainGreen),
                                          //   ),
                                          // ),
                                        );
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
    );
  }
}
   // ElevatedButton(
                                          //     onPressed: () {
                                          //       controller.deleteTrip(controller
                                          //           .keyTripList[index]);
                                          //       controller.tripsList.remove(
                                          //           controller
                                          //               .tripsList[index]);
                                          //     },
                                          //     style: ElevatedButton.styleFrom(
                                          //         backgroundColor:
                                          //             AppColors.mainRedAcecnt,
                                          //         shape: const StadiumBorder(),
                                          //         fixedSize: Size(width * 0.6,
                                          //             height * 0.01)),
                                          //     child: const CustomText(
                                          //         text: "Delete"))// SizedBox(
                //   height: height * 0.05,
                // ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                //   width: width * 0.9,
                //   height: height * 0.35,
                //   decoration: BoxDecoration(
                //       color: AppColors.mainBlue3,
                //       borderRadius: BorderRadius.circular(width * 0.05)),
                //   child: Padding(
                //     padding: EdgeInsets.all(width * 0.05),
                //     child: Column(
                //       children: [
                //         Row(
                //           children: [
                //             Image.asset(
                //               'assets/images/cham.jpg',
                //               width: width * 0.07,
                //             ),
                //             SizedBox(
                //               width: width * 0.03,
                //             ),
                //             constCustomText('Cham Wings'),
                //             const Spacer(),
                //            CustomText(
                //               '340\$',
                //               style: TextStyle(
                //                 color: AppColors.mainBlue1,
                //                 fontSize: width * 0.05,
                //               ),
                //             )
                //           ],
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             constCustomText('10:30'),
                //             Container(
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   color: AppColors.mainWhite1),
                //               width: width * 0.03,
                //               height: width * 0.03,

                //               // Container(
                //               //   decoration: BoxDecoration(
                //               //     shape: BoxShape.circle,
                //               //     color: AppColors.mainBlack,
                //               //   ),
                //               //   width:   width * 0.001,
                //               //   height:   width * 0.001,
                //               // )
                //             ),
                //            CustomText(
                //               '----',
                //               style: TextStyle(
                //                   fontSize: width * 0.1, fontWeight: FontWeight.w100),
                //             ),
                //             SvgPicture.asset('assets/images/plane.svg'),
                //            CustomText('----',
                //                 style: TextStyle(
                //                     fontSize: width * 0.1,
                //                     fontWeight: FontWeight.w100)),
                //             Container(
                //               decoration: BoxDecoration(
                //                 color: AppColors.mainBlue2,
                //                 shape: BoxShape.circle,
                //               ),
                //               width: width * 0.03,
                //               height: width * 0.03,
                //             ),
                //             constCustomText('11:50'),
                //           ],
                //         ),
                //         Row(children: [
                //           SizedBox(
                //             width: width * 0.03,
                //           ),
                //           Column(
                //             children: [
                //              CustomText(DataStrcture.nameCodeAirport['Bahren']!),
                //               constCustomText('Bahren'),
                //             ],
                //           ),
                //           const Spacer(),
                //           Column(
                //             children: [
                //              CustomText(DataStrcture.nameCodeAirport['Syria']!),
                //               constCustomText('Syria'),
                //             ],
                //           ),
                //           SizedBox(
                //             width: width * 0.03,
                //           )
                //         ]),
                //        CustomText(
                //           '-------------------------',
                //           style: TextStyle(
                //               fontSize: width * 0.07, fontWeight: FontWeight.w100),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Container(
                //               width: width * 0.35,
                //               height: width * 0.1,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(width * 0.2),
                //                   color: Colors.white38),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   SvgPicture.asset(
                //                     'assets/images/date.svg',
                //                     width: width * 0.06,
                //                   ),
                //                   SizedBox(
                //                     width: width * 0.02,
                //                   ),
                //                   constCustomText('Date'),
                //                 ],
                //               ),
                //             ),
                //             Container(
                //               width: width * 0.35,
                //               height: width * 0.1,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(width * 0.2),
                //                   color: Colors.white38),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   SvgPicture.asset('assets/images/time.svg'),
                //                   SizedBox(
                //                     width: width * 0.02,
                //                   ),
                //                   constCustomText('Time'),
                //                 ],
                //               ),
                //             )
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),