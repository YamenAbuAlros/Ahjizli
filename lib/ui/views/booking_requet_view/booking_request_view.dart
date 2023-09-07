import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/booking_requet_view/booking_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BookingRequestView extends StatefulWidget {
  const BookingRequestView({super.key});

  @override
  State<BookingRequestView> createState() => _BookingRequestViewState();
}

class _BookingRequestViewState extends State<BookingRequestView> {
  BookingRequestController controller = Get.put(BookingRequestController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                text: 'Flight booking',
                style: TextStyle(
                    color: AppColors.mainGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' requests',
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.mainHntaoe,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          Obx(() => controller.isLoading.value
              ? SpinKitDualRing(
                  color: AppColors.mainGreen,
                )
              : controller.bookingRequests.isNotEmpty
                  ? SizedBox(
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Card(
                                  margin: EdgeInsetsDirectional.only(
                                      top: width * 0.06,
                                      end: width * 0.05,
                                      start: width * 0.05),
                                  elevation: 4,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: width * 0.01),
                                          child: CustomText(
                                              text:
                                                  '${controller.bookingRequests[index].firstname} ${controller.bookingRequests[index].lastname}'),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: width * 0.01,
                                              bottom: width * 0.09),
                                          child: CustomText(
                                              fontWeight: FontWeight.w600,
                                              text: controller
                                                  .bookingRequests[index]
                                                  .tripId!
                                                  .substring(controller
                                                          .bookingRequests[
                                                              index]
                                                          .tripId!
                                                          .length -
                                                      4)),
                                        ),
                                      ],
                                    ), // Row(children: [
                                    //   CustomText(text: controller.bookingRequests[index].)
                                    // ],)
                                    Obx(
                                      () => CustomButton(
                                        text: controller.isViewDetails[index]
                                            ? "Hide details"
                                            : "View details",
                                        textColor: AppColors.mainWhite,
                                        paddingLR: width * 0.03,
                                        backgroundColor: AppColors.mainGreen,
                                        onPressed: () {
                                          controller.isViewDetails[index] =
                                              !controller.isViewDetails[index];
                                        },
                                      ),
                                    )
                                  ]),
                                ),
                                Obx(() => Visibility(
                                    visible: controller.isViewDetails[index],
                                    child: Card(
                                      color: AppColors.mainBlue3,
                                      margin: EdgeInsetsDirectional.only(
                                          top: width * 0.06,
                                          end: width * 0.05,
                                          start: width * 0.05),
                                      elevation: 4,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: width * 0.04,
                                            end: width * 0.04),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                    text:
                                                        "${controller.bookingRequests[index].address!}: ${controller.bookingRequests[index].firstname} ${controller.bookingRequests[index].lastname}"),
                                                CustomText(
                                                    text: controller
                                                        .bookingRequests[index]
                                                        .nationality!),
                                                CustomText(
                                                    text: controller
                                                        .bookingRequests[index]
                                                        .gender!),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomText(
                                                      text: controller
                                                          .bookingRequests[
                                                              index]
                                                          .passportNumber!),
                                                  CustomText(
                                                      text: controller
                                                          .bookingRequests[
                                                              index]
                                                          .expiryDate!),
                                                  CustomText(
                                                      text: controller
                                                          .bookingRequests[
                                                              index]
                                                          .countryOfIssue!),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                    text:
                                                        "${controller.tripsList[controller.bookingRequests[index].tripId]?.from!}"),
                                                SvgPicture.asset(
                                                    'assets/images/plane.svg'),
                                                CustomText(
                                                    text:
                                                        "${controller.tripsList[controller.bookingRequests[index].tripId]?.to!}"),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Icon(
                                                      Icons.arrow_upward),
                                                  Center(
                                                    child: CustomText(
                                                        text:
                                                            "${controller.tripsList[controller.bookingRequests[index].tripId]?.goToDate!}"),
                                                  ),
                                                  CustomText(
                                                      text:
                                                          "${controller.tripsList[controller.bookingRequests[index].tripId]?.goToLeave!}"),
                                                  CustomText(
                                                      text:
                                                          "${controller.tripsList[controller.bookingRequests[index].tripId]?.goToCome!}")
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: controller
                                                      .tripsList[controller
                                                          .bookingRequests[
                                                              index]
                                                          .tripId]
                                                      ?.backDate !=
                                                  "null",
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Icon(
                                                      Icons.arrow_downward),
                                                  Center(
                                                    child: CustomText(
                                                        text:
                                                            "${controller.tripsList[controller.bookingRequests[index].tripId]?.backDate!}"),
                                                  ),
                                                  CustomText(
                                                      text:
                                                          "${controller.tripsList[controller.bookingRequests[index].tripId]?.backLeave!}"),
                                                  CustomText(
                                                      text:
                                                          "${controller.tripsList[controller.bookingRequests[index].tripId]?.backCome!}")
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      vertical: height * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Center(
                                                    child: CustomText(
                                                        text: controller
                                                            .bookingRequests[
                                                                index]
                                                            .seat!),
                                                  ),
                                                  CustomText(
                                                      textcolor: AppColors
                                                          .mainRedAcecnt,
                                                      text: controller
                                                          .bookingRequests[
                                                              index]
                                                          .noticeId!),
                                                  CustomText(
                                                      textcolor: AppColors
                                                          .mainRedAcecnt,
                                                      
                                                      text:
                                                          "${controller.bookingRequests[index].price!} \$"),
                                                ],
                                              ),
                                            ),
                                            CustomButton(
                                              text: "Confirm This reservation",
                                              textColor: AppColors.mainWhite,
                                              paddingLR: width * 0.02,
                                              backgroundColor:
                                                  AppColors.mainRedAcecnt,
                                              onPressed: () {
                                                controller
                                                    .showBottomSheetwithGetX(
                                                        controller
                                                                .bookingRequests[
                                                            index],
                                                        index);
                                                // sendSms(
                                                //     controller
                                                //         .bookingRequests[index]
                                                //         .phone!,
                                                //     "Your reservation has been completed and thank you for trusting us\n ${AirLinesData.selectedOfficeName}");
                                                // controller.changeLocation(
                                                //     controller
                                                //         .bookingRequests[index],
                                                //     index);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    )))
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: height * 0.05,
                            );
                          },
                          itemCount: controller.bookingRequests.value.length),
                    )
                  : const Center(
                      child: CustomText(text: 'No requests are available'),
                    )),
          (height * 0.05).sbheight,
        ],
      ),
    );
  }
}
