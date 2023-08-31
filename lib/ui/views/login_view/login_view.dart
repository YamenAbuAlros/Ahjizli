// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:booking_flights/ui/shared/colors.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_button.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_text.dart';
import 'package:booking_flights/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:booking_flights/ui/shared/extensions/extensions.dart';
import 'package:booking_flights/ui/shared/utilis.dart';
import 'package:booking_flights/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: width * 0.05, end: width * 0.05, top: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    CustomText(
                        text: 'Login',
                        fontsize: width * 0.05,
                        textcolor: AppColors.mainBlueforText),
                    const Spacer(),
                    InkWell(
                      child: SvgPicture.asset('assets/images/ic_back.svg'),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                (height * 0.05).sbheight,

                Center(
                  child: CustomText(
                      text: 'Add Your Details To Login',
                      fontsize: width * 0.05,
                      textcolor: AppColors.mainBlueforText),
                ),
                (height * 0.05).sbheight,
                CustomText(
                  text: 'Email',
                  fontsize: width * 0.05,
                ),
                (height * 0.02).sbheight,

                CustomTextField(
                  suffixIconName: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                  hinttext: 'Email',
                  controller: controller.emailController,
                  mheight: width * 0.05,
                  mwidth: width * 0.05,
                  validator: (value) {
                    if (value == '') {
                      return 'Please Enter Your Email';
                    } else if (!checkEmail(value!)) {
                      return 'Please Check Your Email';
                    }
                    return null;
                  },
                ),
                (height * 0.05).sbheight,
                CustomText(
                  text: 'Password',
                  fontsize: width * 0.05,
                ),
                (height * 0.02).sbheight,

                CustomTextField(
                  suffixIconName: const Icon(Icons.remove_red_eye),
                  keyboardType: TextInputType.visiblePassword,
                  hinttext: 'Password',
                  validator: (value) {
                    if (value == '') {
                      return 'Please Enter Your Password';
                    } else if (!validatePassword(value!)) {
                      return 'Please Check Your Password';
                    }
                    return null;
                  },
                  controller: controller.passwordController,
                  mheight: width * 0.05,
                  mwidth: width * 0.05,
                ),

                (height * 0.05).sbheight,

                CustomButton(
                    backgroundColor: AppColors.mainBlue2,
                    text: 'Login',
                    textColor: AppColors.mainWhite,
                    paddingLR: width * 0.05,
                    onPressed: () {
                      controller.checkLogin();
                    }),

                //  ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
