// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/main_user_view/complete_book_view/complete_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../choose_seat_view/choose_seat_view.dart';

class CompleteBooking extends StatefulWidget {
  const CompleteBooking({super.key, required this.flightData, this.keytrip});
  final flightData, keytrip;
  @override
  State<CompleteBooking> createState() => _CompleteBookingState();
}

class _CompleteBookingState extends State<CompleteBooking> {
  late CompleteBookController controller;
  @override
  void initState() {
    controller =
        Get.put(CompleteBookController(widget.flightData, widget.keytrip));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: width * 0.05, end: width * 0.05),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (height * 0.02).sbheight,
                      // Center(
                      //   child: RichText(
                      //     text: TextSpan(
                      //         text: 'Welcome To Complete',
                      //         style: TextStyle(
                      //             color: AppColors.mainHntaoe,
                      //             fontSize: width * 0.075,
                      //             fontWeight: FontWeight.bold),
                      //         children: [
                      //           TextSpan(
                      //             text: '\nYour Reservation',
                      //             style: TextStyle(
                      //                 fontSize: width * 0.075,
                      //                 color: AppColors.mainGreen,
                      //                 fontWeight: FontWeight.bold),
                      //           )
                      //         ]),
                      //   ),
                      // ),
                      Container(
                        width: width,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: AppColors.mainBlue1,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                bottomRight: Radius.circular(22))),
                        child: CustomText(
                            // backgroundColor: AppColors.mainPink,
                            fontsize: width * 0.045,
                            textcolor: AppColors.mainBlue3,
                            text:
                                "Please enter the data as it appears on the passport"),
                      ),
                      (height * 0.01).sbheight,

                      (height * 0.03).sbheight,
                      CustomText(
                          text: "Passenger Info",
                          textcolor: AppColors.mainHntaoe,
                          fontWeight: FontWeight.bold,
                          fontsize: width * 0.05),
                      (height * 0.03).sbheight,
                      DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return "required Field";
                            }
                            return null;
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: AppColors.mainBlue1,
                          ),
                          decoration: InputDecoration(
                              labelText: "Address",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1)),
                              fillColor: AppColors.mainBlue3,
                              filled: true),
                          hint: const CustomText(text: 'Select Address'),
                          value: controller.address,
                          elevation: 2,
                          isExpanded: true,
                          items: controller.addressList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(text: value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.address = value;
                          }),
                      (height * 0.03).sbheight,
                      CustomTextField(
                        validator: (value) {
                          if (value == '') return 'required Field';
                          if (!isName(value!)) return 'Please Enter Valid Name';
                          return null;
                        },
                        label: "Firstname",
                        mheight: width * 0.1,
                        mwidth: width * 0.9,
                        controller: controller.firstnameController,
                      ),
                      (height * 0.03).sbheight,
                      CustomTextField(
                        validator: (value) {
                          if (value == '') return 'required Field';
                          if (!isName(value!)) return 'Please Enter Valid Name';
                          return null;
                        },
                        label: "Lastname",
                        mheight: width * 0.1,
                        mwidth: width * 0.9,
                        controller: controller.lastnameController,
                      ),
                      (height * 0.03).sbheight,
                      InkWell(
                          onTap: () {
                            controller
                                .datePicker(controller.dateController.value);
                          },
                          child: Obx(
                            () => IgnorePointer(
                              child: CustomTextField(
                                readonly: true,
                                validator: (value) {
                                  if (value == '') return 'required Field';

                                  return null;
                                },
                                label: "Date of Birth",
                                mheight: width * 0.1,
                                mwidth: width * 0.9,
                                controller: controller.dateController.value,
                              ),
                            ),
                          )),
                      (height * 0.03).sbheight,
                      DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return "required Field";
                            }
                            return null;
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: AppColors.mainBlue1,
                          ),
                          decoration: InputDecoration(
                              labelText: "Gender",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1)),
                              fillColor: AppColors.mainBlue3,
                              filled: true),
                          hint: const CustomText(text: 'Select Gender'),
                          value: controller.gender,
                          elevation: 2,
                          isExpanded: true,
                          items: controller.genderList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(text: value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.gender = value;
                          }),

                      (height * 0.03).sbheight,
                      DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return "required Field";
                            }
                            return null;
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: AppColors.mainBlue1,
                          ),
                          decoration: InputDecoration(
                              labelText: "Nationality",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1)),
                              fillColor: AppColors.mainBlue3,
                              filled: true),
                          hint: const CustomText(text: 'Select Nationality'),
                          value: controller.nationality,
                          elevation: 2,
                          isExpanded: true,
                          items: controller.nationalityList.values
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(text: value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.nationality = value;
                          }),

                      (height * 0.03).sbheight,
                      //?
                      CustomText(
                          text: "PassPort",
                          textcolor: AppColors.mainHntaoe,
                          fontWeight: FontWeight.bold,
                          fontsize: width * 0.05),
                      (height * 0.03).sbheight,
                      CustomTextField(
                        validator: (value) {
                          if (value == '') return 'required field';
                          return null;
                        },
                        label: "Passport number",
                        mheight: width * 0.1,
                        mwidth: width * 0.9,
                        controller: controller.passportNumberController,
                      ),
                      (height * 0.03).sbheight,
                      InkWell(
                          onTap: () {
                            controller
                                .datePicker(controller.expiryController.value);
                          },
                          child: Obx(
                            () => IgnorePointer(
                              child: CustomTextField(
                                readonly: true,
                                validator: (value) {
                                  if (value == '') return 'required Field';

                                  if (DateTime.now().month + 6 > 12) {
                                    if (DateTime(
                                            DateTime.now().year + 1,
                                            DateTime.now().month - 6,
                                            DateTime.now().day)
                                        .isAfter(DateTime(
                                            int.parse(controller
                                                .expiryController.value.text
                                                .split("-")[0]),
                                            int.parse(controller
                                                .expiryController.value.text
                                                .split("-")[1]),
                                            int.parse(controller
                                                .expiryController.value.text
                                                .split("-")[2])))) {
                                      return "Your Passport Is Not Valid To Six Month";
                                    }
                                  } else {
                                    DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month + 6,
                                        DateTime.now().day);
                                  }

                                  return null;
                                },
                                label: "Expiry date",
                                mheight: width * 0.1,
                                mwidth: width * 0.9,
                                controller: controller.expiryController.value,
                              ),
                            ),
                          )),

                      (height * 0.03).sbheight,
                      DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return "required Field";
                            }
                            return null;
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: AppColors.mainBlue1,
                          ),
                          decoration: InputDecoration(
                              labelText: "Country of Issue",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.1)),
                              fillColor: AppColors.mainBlue3,
                              filled: true),
                          hint:
                              const CustomText(text: 'Select Country of Issue'),
                          value: controller.countryIssue,
                          elevation: 2,
                          isExpanded: true,
                          items: controller.nationalityList.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(text: value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.countryIssue = value;
                          }),

                      (height * 0.03).sbheight,
                      CustomText(
                          text: "Communication info",
                          textcolor: AppColors.mainHntaoe,
                          fontWeight: FontWeight.bold,
                          fontsize: width * 0.05),
                      (height * 0.03).sbheight,
                      CustomTextField(
                        validator: (value) {
                          if (value == '') return 'required Faield';
                          if (!checkEmail(value!)) {
                            return 'Please check your Email';
                          }
                          return null;
                        },
                        label: "Email",
                        mheight: width * 0.1,
                        mwidth: width * 0.9,
                        controller: controller.emailController,
                      ),
                      (height * 0.03).sbheight,
                      CustomTextField(
                        maxlength: 10,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == "") return "Please Enter Phone";
                          if (!isNumber(value!)) {
                            return "Please Start 09********";
                          }
                          return null;
                        },
                        label: "Phone",
                        mheight: width * 0.1,
                        mwidth: width * 0.9,
                        controller: controller.phoneController,
                      ),
                      (height * 0.03).sbheight,
                      CustomButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              Map<String, dynamic> data = {
                                // "FlightId": widget.flightData,
                                'Address': controller.address,
                                'Firstname':
                                    controller.firstnameController.text,
                                'Lastname': controller.lastnameController.text,
                                'DateOfBirth':
                                    controller.dateController.value.text,
                                'Gender': controller.gender,
                                'Nationality': controller.nationality,
                                'PassportNumber':
                                    controller.passportNumberController.text,
                                'ExpiryDate':
                                    controller.expiryController.value.text,
                                'CountryOfIssue': controller.countryIssue,
                                'Email': controller.emailController.text,
                                'Phone': controller.phoneController.text,
                              };
                              // print(controller.flightData.runtimeType);
                              Get.off(() => ChooseSeatView(
                                    tripData: controller.flightData,
                                    keyTrip: controller.keyTrip,
                                    passengerData: data,
                                    // bookingInfo: data,
                                  ));

                              // Map<String, dynamic> bookingInfo = BookingTrip(
                              //   address: controller.address,
                              //   firstname: controller.firstnameController.text,
                              //   lastname: controller.lastnameController.text,
                              //   dateOfBirth:
                              //       controller.dateController.value.text,
                              //   gender: controller.gender,
                              //   nationality: controller.nationality,
                              //   passportNumber:
                              //       controller.passportNumberController.text,
                              //   expiryDate:
                              //       controller.expiryController.value.text,
                              //   countryOfIssue:
                              //       controller.countryController.text,
                              //   email: controller.emailController.text,
                              //   phone: controller.phoneController.text,
                              // ).toJson();
                              // controller.bookTrip({
                              //   'Address': controller.address,
                              //   'Firstname':
                              //       controller.firstnameController.text,
                              //   'Lastname': controller.lastnameController.text,
                              //   'DateOfBirth': controller.dateController,
                              //   'Gender': controller.gender,
                              //   'Nationality': controller.nationality,
                              //   'PassportNumber':
                              //       controller.passportNumberController.text,
                              //   'ExpiryDate': controller.expiryController,
                              //   'CountryOfIssue':
                              //       controller.countryController.text,
                              //   'Email': controller.emailController.text,
                              //   'Phone': controller.phoneController.text,

                              // "Round": controller.selectedRound.toString(),
                              // "From": fromCity.toString(),
                              // "To": toCity.toString(),
                              // "Price":
                              // controller.priceController.text.toString(),
                              // "Airline": airLinesnval.toString(),
                              // "Go To Date": controller
                              //     .selectedDateController.text
                              //     .toString(),
                              // "Go To Leave": controller.leaveTimeController.text
                              //     .toString(),
                              // "Go To Come":
                              //     controller.comeTimeController.text.toString(),
                              // "Back Date": controller.selectedRound.value
                              //     ? controller.selectedDate1Controller.text
                              //         .toString()
                              //     : null,
                              // "Back Leave": controller.selectedRound.value
                              //     ? controller.leaveTime1Controller.text
                              //         .toString()
                              //     : null,
                              // "Back Come": controller.selectedRound.value
                              //     ? controller.comeTime1Controller.text
                              //         .toString()
                              // : null
                              // });
                              // Get.to(()=>ChooseSeat())
                            }
                          },
                          text: "Continue",
                          textColor: AppColors.mainWhite,
                          paddingLR: width * 0.05)
                    ]),
              ),
            ),
          )),
    );
  }
}
