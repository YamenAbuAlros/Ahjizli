// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/datastructure/datastructure_controller.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/main_user_view/payments_view/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key, this.passengerData, this.keyTrip});
  final passengerData;
  final keyTrip;

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late PaymentController controller;

  @override
  void initState() {
    controller =
        Get.put(PaymentController(widget.passengerData, widget.keyTrip));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: width * 0.04, start: width * 0.05, end: width * 0.05),
              child: Form(
                key: controller.keyForm,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Book',
                              style: TextStyle(
                                  color: AppColors.mainGreen,
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: ' your ticket and ',
                                  style: TextStyle(
                                      fontSize: width * 0.07,
                                      color: AppColors.mainHntaoe,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'pay',
                                  style: TextStyle(
                                      fontSize: width * 0.07,
                                      color: AppColors.mainGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: ' through AlHaram',
                                  style: TextStyle(
                                      fontSize: width * 0.07,
                                      color: AppColors.mainHntaoe,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                        Positioned(
                            right: 0,
                            top: width * 0.09,
                            child: Image.asset(
                              "assets/images/logoalhram.png",
                              scale: 2,
                            )),
                      ],
                    ),
                    Card(
                      margin: EdgeInsetsDirectional.only(
                        top: width * 0.4,
                      ),
                      elevation: 4,
                      child: Column(children: [
                        RichText(
                          text: TextSpan(
                              text:
                                  'The amount you are required to \ntransfer is:',
                              style: TextStyle(
                                color: AppColors.mainBlack,
                                fontSize: width * 0.06,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      ' ${controller.passengerDate["price"]}\$ ',
                                  style: TextStyle(
                                      fontSize: width * 0.06,
                                      color: AppColors.mainGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '\nto Number:',
                                  style: TextStyle(
                                    fontSize: width * 0.06,
                                    color: AppColors.mainBlack,
                                  ),
                                ),
                                TextSpan(
                                  text: AirLinesData.officeData[controller.passengerDate['OfficeName']]['PhoneNumber']                                     .toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.06,
                                      color: AppColors.mainGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '\nName:',
                                  style: TextStyle(
                                    fontSize: width * 0.06,
                                    color: AppColors.mainBlack,
                                  ),
                                ),
                                TextSpan(
                                  text: AirLinesData.officeData[controller.passengerDate['OfficeName']]['Name']
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.06,
                                      color: AppColors.mainGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: width * 0.03,
                              start: width * 0.03,
                              end: width * 0.03),
                          child: TextFormField(
                              onTap: () {},
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == "") {
                                  return "Please Enter Notice-Id";
                                }

                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Notice Id',
                                  // hintText: hinttext,
                                  hintStyle: TextStyle(
                                      color: AppColors.mainBlue1,
                                      fontSize: width * 0.04),
                                  constraints: BoxConstraints(
                                      minWidth: width * 0.5,
                                      minHeight: height * 0.1),
                                  contentPadding: EdgeInsetsDirectional.only(
                                      start: width * 0.09),
                                  filled: true,
                                  fillColor: AppColors.mainBlue3,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.09),
                                      borderSide: BorderSide(
                                          color: AppColors.mainBlack)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(width * 0.1)))),
                              controller: controller.noticeId),
                        )
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: width * 0.2),
                      child: CustomButton(
                        onPressed: () {
                          if (controller.keyForm.currentState!.validate()) {
                            controller.saveInDataBase();
                          }
                        },
                        text: "Get the ticket",
                        textColor: AppColors.mainWhite,
                        paddingLR: width * 0.03,
                        backgroundColor: AppColors.mainGreen,
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
