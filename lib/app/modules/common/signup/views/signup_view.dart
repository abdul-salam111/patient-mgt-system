import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          20.heightBox,
          Center(
            child: Column(
              children: [
                CustomText(
                    text: "Register",
                    fontSize: 30.sp,
                    color: blackcolor,
                    fontWeight: FontWeight.bold),
                10.heightBox,
                Text(
                  "Please input information in the fields below to enter your journey platform.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textfieldgrey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal),
                ),
                40.heightBox,
                CustomTextField(
                    labelText: "Enter Full Name",
                    hintText: "Abdul Salam",
                    controller: controller.fullNameController.value,
                    validator: Validators.validation("Full Name")),
                20.heightBox,
                CustomTextField(
                    labelText: "Enter Email",
                    hintText: "AbdulSalam@gmail.com",
                    controller: controller.emailController.value,
                    validator: Validators.emailValidator),
                20.heightBox,
                CustomTextFieldForPassword(
                    labelText: "Set Password",
                    hintText: "**********",
                    controller: controller.passwordController.value,
                    validator: Validators.validatePassword),
                20.heightBox,
                CustomTextFieldForPassword(
                    labelText: "Re-Type Password",
                    hintText: "**********",
                    controller: controller.retypePasswordController.value,
                    validator: Validators.validatePassword),
                30.heightBox,
                CustomButton(text: "Register", onPressed: () {}),
                20.heightBox,
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SIGNIN);
                    },
                    child: Image.asset(
                      "assets/images/haveaccount.png",
                      width: 200.w,
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
