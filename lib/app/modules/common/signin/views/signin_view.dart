import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: pad16,
      child: ListView(
        children: [
          30.heightBox,
          Center(
            child: Column(
              children: [
                CustomText(
                    text: "Welcome Back",
                    fontSize: 30.sp,
                    color: blackcolor,
                    fontWeight: FontWeight.bold),
                5.heightBox,
                CustomText(
                    text: "Login to your account",
                    fontSize: 16.sp,
                    color: textfieldgrey,
                    fontWeight: FontWeight.normal),
                40.heightBox,
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          labelText: "Enter Email",
                          hintText: "Abdul@gmail.com",
                          controller: controller.emailContorller.value,
                          validator: Validators.emailValidator),
                      20.heightBox,
                      CustomTextFieldForPassword(
                          labelText: "Enter Password",
                          hintText: "**********",
                          controller: controller.passwordContorller.value,
                          validator: Validators.validatePassword),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        activeColor: primarycolor,
                        value: controller.isRemembered.value,
                        onChanged: (value) {
                          controller.toggleRememberMe();
                        },
                      );
                    }),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        color: Color(0xFF949090),
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          controller.showModalSheetForOtp(context);
                        },
                        child: Image.asset(
                          "assets/images/forgetpassword.png",
                          width: 100,
                        )),
                  ],
                ),
                20.heightBox,
                CustomButton(
                    text: "Login",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.signInUser();
                      }
                    }),
                100.heightBox,
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Image.asset(
                    "assets/images/noaccount.png",
                    width: 250.w,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
