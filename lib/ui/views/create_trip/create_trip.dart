// ignore_for_file: deprecated_member_use

import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/create_trip/create_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import "package:intl/intl.dart";

class CreateTrip extends StatefulWidget {
  const CreateTrip({super.key});

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  CreateTripController controller = Get.put(CreateTripController());

  String? airLinesnval, fromCity, toCity;
  bool isClicked = false;
  String selectedDate = 'DepartureDate';
  String leaveTime = 'DepartureTime';
  String comeTime = 'AccessTime';
  String selectedDate1 = 'BackDate';
  String leaveTime1 = 'DepartureTime';
  String comeTime1 = 'AccessTime';
  void _datePicker(String trip) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((value) {
      if (value != null) {
        setState(() {
          trip == 'Thahab'
              ? controller.selectedDateController.text =
                  DateFormat('yyyy-MM-dd').format(value).toString()
              // selectedDate = DateFormat('yyyy-MM-dd').format(value).toString()
              : controller.selectedDate1Controller.text =
                  DateFormat('yyyy-MM-dd').format(value).toString();
          // selectedDate1 =
          //     DateFormat('yyyy-MM-dd').format(value).toString();
        });
      }
    });
  }

  void _timePicker(String tripType, String timeType) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        timeType == 'Leave'
            ? setState(() {
                // leaveTime =
                //     '${value.hour > 12 ? value.hour - 12 : value.hour} : ${value.minute}${value.minute == 0 ? 0 : ''} ${value.period.name}';
                tripType == 'Thahab'
                    ? controller.leaveTimeController.text =
                        value.format(context).toString()
                    : controller.leaveTime1Controller.text =
                        value.format(context).toString();
              })
            : setState(() {
                // comeTime =
                //     '${value.hour > 12 ? value.hour - 12 : value.hour} : ${value.minute}${value.minute == 0 ? 0 : ''} ${value.period.name}';
                tripType == 'Thahab'
                    ? controller.comeTimeController.text =
                        value.format(context).toString()
                    : controller.comeTime1Controller.text =
                        value.format(context).toString();
              });
      } else {
        timeType == 'Leave'
            ? setState(() {
                // leaveTime =
                //     '${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour} : ${DateTime.now().minute} ${DateTime.now().hour > 12 ? 'pm' : 'am'}';
                tripType == 'Thahab'
                    ? controller.leaveTimeController.text =
                        DateTime.now.toString()
                    : controller.leaveTime1Controller.text =
                        DateTime.now.toString();
              })
            : setState(() {
                // comeTime =
                //     '${DateTime.now().hour > 12 ? DateTime.now().hour - 12 : DateTime.now().hour} : ${DateTime.now().minute} ${DateTime.now().hour > 12 ? 'pm' : 'am'}';
                tripType == 'Thahab'
                    ? controller.comeTimeController.text =
                        DateTime.now().toString()
                    : controller.comeTime1Controller.text =
                        DateTime.now().toString();
              });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Form(
        key: controller.keyForm,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.25,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: AppColors.mainBlue1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Create',
                        style: TextStyle(
                            color: AppColors.mainGreen,
                            fontSize: width * 0.075,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: ' Your\nNew Flight',
                            style: TextStyle(
                                fontSize: width * 0.075,
                                color: AppColors.mainWhite,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SvgPicture.asset(
                    'assets/images/airplane.svg',
                    width: 50,
                    color: AppColors.mainBlue3,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.2),
              child: Container(
                padding: EdgeInsets.all(
                  width * 0.06,
                ),
                margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                width: width * 0.8,
                height: height * 0.75,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.mainWhite,
                ),
                child: ListView(children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: controller.colorRound.value,
                                shape: const StadiumBorder()),
                            onPressed: () {
                              controller.setTripType('Round');
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.mainWhite,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: SvgPicture.asset(
                                    'assets/images/round_trip.svg',
                                    width: 27,
                                  ),
                                ),
                                (width * 0.01).sbwidth,
                                CustomText(
                                    text: 'Return',
                                    textcolor: AppColors.mainBlack,
                                    )
                              ],
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: controller.colorOneWay.value,
                                shape: const StadiumBorder()),
                            onPressed: () {
                              controller.setTripType('One_Way');
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.mainWhite,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: SvgPicture.asset(
                                    'assets/images/one_way.svg',
                                    width: 27,
                                  ),
                                ),
                                (width * 0.01).sbwidth,
                                CustomText(
                                    text: 'One Way',
                                    textcolor: AppColors.mainBlack,
                                    )
                              ],
                            )),
                      ],
                    ),
                  ),
                  (height * 0.03).sbheight,
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "required Field";
                        }
                        return null;
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on),
                          labelText: "Origin",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.1)),
                          fillColor: AppColors.mainBlue3,
                          filled: true),
                      hint: const CustomText(text: 'Select From'),
                      value: fromCity,
                      elevation: 2,
                      isExpanded: true,
                      items: AirLinesData.nameCodeAirport.keys
                          .toList()
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              CustomText(
                                  text: AirLinesData.nameCodeAirport[value]!),
                              const Spacer(),
                              CustomText(text: value),
                              (width * 0.03).sbwidth
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          fromCity = value!;
                        });
                      }),
                  (width * 0.04).sbheight,
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "required Field";
                        }
                        return null;
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on),
                          labelText: 'Destination',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.1)),
                          fillColor: AppColors.mainBlue3,
                          filled: true),
                      hint: const CustomText(text: 'Select To'),
                      // disabledHint: constCustomText('Sele'),
                      value: toCity,
                      elevation: 2,
                      isExpanded: true,
                      items: AirLinesData.nameCodeAirport.keys
                          .toList()
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              CustomText(
                                  text: AirLinesData.nameCodeAirport[value]!),
                              const Spacer(),
                              CustomText(text: value),
                              (width * 0.03).sbwidth
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          toCity = value!;
                        });
                      }),
                  (width * 0.04).sbheight,
                  TextFormField(
                    controller: controller.priceController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter price";
                      } else if (!isPrice(
                          controller.priceController.text.toString())) {
                        return 'please enter valid price';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.mainBlue3,
                        labelText: 'Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(width * 0.1)))),
                  ),
                  (height * 0.02).sbheight,
                  DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "required Field";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Airlines',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.1)),
                          fillColor: AppColors.mainBlue3,
                          filled: true),
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.deepPurple,
                      ),
                      hint: const CustomText(text: 'Selected Airlines'),
                      // disabledHint: constCustomText('Sele'),
                      value: airLinesnval,
                      elevation: 2,
                      isExpanded: true,
                      items: AirLinesData.airLinesImages.keys
                          .toList()
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              CustomText(text: value),
                              const Spacer(),
                              ...[
                                AirLinesData.airLinesImages[value] != ''
                                    ? Image.asset(
                                        AirLinesData.airLinesImages[value]!,
                                        alignment: Alignment.centerRight,
                                        width: width * 0.1,
                                        height: width * 0.08,
                                      )
                                    : const CustomText(text: '')
                              ],
                              (width * 0.01).sbwidth,
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          airLinesnval = value!;
                        });
                      }),
                  (height * 0.02).sbheight,
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "required Field";
                      }
                      return null;
                    },
                    textInputAction: null,
                    readOnly: true,
                    controller: controller.selectedDateController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.all(width * 0.02),
                      labelText: 'DepartureDate',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.1))),
                      hintText: selectedDate,
                      fillColor: AppColors.mainBlue3,
                      filled: true,
                      // constraints: BoxConstraints(
                      //   maxHeight: height * 0.05,
                      // ),
                    ),
                    onTap: () => _datePicker('Thahab'),
                  ),
                  (width * 0.04).sbheight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "required Field";
                          }
                          return null;
                        },
                        textInputAction: null,
                        controller: controller.leaveTimeController,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsetsDirectional.all(width * 0.02),
                          labelText: 'DepartureTime',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(width * 0.1))),
                          hintText: leaveTime,
                          fillColor: AppColors.mainBlue3,
                          filled: true,
                          constraints: BoxConstraints(maxWidth: width * 0.28),
                        ),
                        onTap: () => _timePicker('Thahab', 'Leave'),
                      ),
                      SvgPicture.asset(
                        "assets/images/one_way.svg",
                        color: AppColors.mainBlue1,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "required Field";
                          }
                          return null;
                        },
                        readOnly: true,
                        textInputAction: null,
                        controller: controller.comeTimeController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsetsDirectional.all(width * 0.02),
                          labelText: 'AccessTime',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(width * 0.1))),
                          hintText: comeTime,
                          fillColor: AppColors.mainBlue3,
                          filled: true,
                          constraints: BoxConstraints(maxWidth: width * 0.28),
                        ),
                        onTap: () => _timePicker('Thahab', 'Come'),
                      ),
                    ],
                  ),
                  (height * 0.02).sbheight,
                  Obx(
                    () => Visibility(
                      visible: controller.selectedRound.value,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required Field";
                              }
                              return null;
                            },
                            textInputAction: null,
                            readOnly: true,
                            controller: controller.selectedDate1Controller,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsetsDirectional.all(width * 0.02),
                              labelText: 'BackDate',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(width * 0.1))),
                              hintText: selectedDate,
                              fillColor: AppColors.mainBlue3,
                              filled: true,
                            ),
                            onTap: () => _datePicker('Iyap'),
                          ),
                          (width * 0.04).sbheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "required Field";
                                  }
                                  return null;
                                },
                                textInputAction: null,
                                controller: controller.leaveTime1Controller,
                                readOnly: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsetsDirectional.all(width * 0.02),
                                  labelText: 'DepartureTime',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width * 0.1))),
                                  hintText: leaveTime,
                                  fillColor: AppColors.mainBlue3,
                                  filled: true,
                                  constraints:
                                      BoxConstraints(maxWidth: width * 0.28),
                                ),
                                onTap: () => _timePicker('Iyap', 'Leave'),
                              ),
                              SvgPicture.asset(
                                "assets/images/one_way.svg",
                                color: AppColors.mainBlue1,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "required Field";
                                  }
                                  return null;
                                },
                                readOnly: true,
                                textInputAction: null,
                                controller: controller.comeTime1Controller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsetsDirectional.all(width * 0.02),
                                  labelText: 'AccessTime',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width * 0.1))),
                                  hintText: comeTime,
                                  fillColor: AppColors.mainBlue3,
                                  filled: true,
                                  constraints:
                                      BoxConstraints(maxWidth: width * 0.28),
                                ),
                                onTap: () => _timePicker('Iyap', 'Come'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: height * 0.028),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.6, height * 0.05),
                            backgroundColor: AppColors.mainGreen,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          if (controller.keyForm.currentState!.validate()) {
                            controller.addNewTrip({
                              'BusinessSeats': AirLinesData.businessSeats,
                              'EconomySeats': AirLinesData.economySeats,
                              "Round": controller.selectedRound.toString(),
                              "From": fromCity.toString(),
                              "To": toCity.toString(),
                              "Price":
                                  controller.priceController.text.toString(),
                              "Airline": airLinesnval.toString(),
                              "Go To Date": controller
                                  .selectedDateController.text
                                  .toString(),
                              "Go To Leave": controller.leaveTimeController.text
                                  .toString(),
                              "Go To Come":
                                  controller.comeTimeController.text.toString(),
                              "Back Date": controller.selectedRound.value
                                  ? controller.selectedDate1Controller.text
                                      .toString()
                                  : null,
                              "Back Leave": controller.selectedRound.value
                                  ? controller.leaveTime1Controller.text
                                      .toString()
                                  : null,
                              "Back Come": controller.selectedRound.value
                                  ? controller.comeTime1Controller.text
                                      .toString()
                                  : null,
                              "OfficeName": AirLinesData.selectedOfficeName
                            });
                            customLoader();
                          }
                        },
                        child: const CustomText(text: 'Create Flight')),
                  )
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}




                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       shape: const StadiumBorder(),
                  //       backgroundColor: AppColors.mainWhite,
                  //       fixedSize: Size(width * 0.28, height * 0.05)),
                  //   onPressed: () {
                  //     setState(() {
                  //       isClicked = true;
                  //     });

                  //     _datePicker('Thahab');
                  //   },
                  //   child:CustomText(
                  //     selectedDate,
                  //     style: TextStyle(color: AppColors.mainBlack),
                  //   ),
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             shape: const StadiumBorder(),
                  //             backgroundColor: AppColors.mainWhite,
                  //             fixedSize: Size(width * 0.29, height * 0.05)),
                  //         onPressed: () => _timePicker('Thahab', 'Leave'),
                  //         child:CustomText(
                  //           leaveTime,
                  //           style: TextStyle(color: AppColors.mainBlack),
                  //         ),
                  //       ),
                  //       // (width * 0.1).sbwidth,
                  //       SvgPicture.asset(
                  //         "assets/images/one_way.svg",
                  //         color: AppColors.mainBlue1,
                  //       ),
                  //       ElevatedButton(
                  //         statesController: MaterialStatesController(),
                  //         style: ElevatedButton.styleFrom(
                  //             shape: const StadiumBorder(),
                  //             backgroundColor: AppColors.mainWhite,
                  //             fixedSize: Size(width * 0.29, height * 0.05)),
                  //         onPressed: () => _timePicker('Thahab', 'Come'),
                  //         child:CustomText(
                  //           comeTime,
                  //           style: TextStyle(
                  //               color: AppColors.mainBlack,
                  //               fontSize: width * 0.03),
                  //         ),
                  //       )
                  //     ]),

                  // Visibility(
                  //   visible: selectedRound,
                  //   child: Column(
                  //     children: [
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //             shape: const StadiumBorder(),
                  //             backgroundColor: AppColors.mainWhite,
                  //             fixedSize: Size(width * 0.28, height * 0.05)),
                  //         onPressed: () => _datePicker('Iyap'),
                  //         child:CustomText(
                  //           selectedDate1,
                  //           style: TextStyle(color: AppColors.mainBlack),
                  //         ),
                  //       ),
                  //       Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   shape: const StadiumBorder(),
                  //                   backgroundColor: AppColors.mainWhite,
                  //                   fixedSize:
                  //                       Size(width * 0.28, height * 0.05)),
                  //               onPressed: () => _timePicker('Iyap', 'Leave'),
                  //               child:CustomText(
                  //                 leaveTime1,
                  //                 style: TextStyle(color: AppColors.mainBlack),
                  //               ),
                  //             ),
                  //             // (width * 0.1).sbheight,
                  //             SvgPicture.asset(
                  //               "assets/images/one_way.svg",
                  //               color: AppColors.mainBlue1,
                  //             ),

                  //             ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   shape: const StadiumBorder(),
                  //                   backgroundColor: AppColors.mainWhite,
                  //                   fixedSize:
                  //                       Size(width * 0.28, height * 0.05)),
                  //               onPressed: () => _timePicker('Iyap', 'Come'),
                  //               child:CustomText(
                  //                 comeTime1,
                  //                 style: TextStyle(color: AppColors.mainBlack),
                  //               ),
                  //             )
                  //           ]),
                  //     ],
                  //   ),
                  // ),

                  // TextFormField(
                  //   readOnly: true,
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsetsDirectional.all(width * 0.02),
                  //     labelText: 'GoDate',
                  //     border: OutlineInputBorder(
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(width * 0.1))),
                  //     hintText: selectedDate,
                  //     fillColor: AppColors.mainBlue3,
                  //     filled: true,
                  //     constraints: BoxConstraints(
                  //         maxHeight: height * 0.05, maxWidth: width * 0.18),
                  //   ),
                  //   onTap: () => _datePicker('Thahab'),
                  // ),
                  // (width * 0.04).sbheight,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     TextFormField(
                  //       readOnly: true,
                  //       decoration: InputDecoration(
                  //         contentPadding:
                  //             EdgeInsetsDirectional.all(width * 0.02),
                  //         labelText: 'GoLeave',
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //                 Radius.circular(width * 0.1))),
                  //         hintText: leaveTime,
                  //         fillColor: AppColors.mainBlue3,
                  //         filled: true,
                  //         constraints: BoxConstraints(
                  //             maxHeight: height * 0.05, maxWidth: width * 0.28),
                  //       ),
                  //       onTap: () => _timePicker('Thahab', 'Leave'),
                  //     ),
                  //     TextFormField(
                  //       readOnly: true,
                  //       decoration: InputDecoration(
                  //         contentPadding:
                  //             EdgeInsetsDirectional.all(width * 0.02),
                  //         labelText: 'GoCome',
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //                 Radius.circular(width * 0.1))),
                  //         hintText: comeTime,
                  //         fillColor: AppColors.mainBlue3,
                  //         filled: true,
                  //         constraints: BoxConstraints(
                  //             maxHeight: height * 0.05, maxWidth: width * 0.28),
                  //       ),
                  //       onTap: () => _timePicker('Thahab', 'Come'),
                  //     ),
                  //   ],
                  // ),