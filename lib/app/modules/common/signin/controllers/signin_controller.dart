import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/data/postModels/doctor/signInPostModel.dart';
import 'package:patient_management/app/repositories/Auth/AuthRepository.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

class SigninController extends GetxController {
  final emailContorller = TextEditingController().obs;
  final passwordContorller = TextEditingController().obs;
  final confirmContorller = TextEditingController().obs;
  var isRemembered = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  void showModalSheetForEmail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: whitecolor,
          ),
          padding: const EdgeInsets.all(16.0),
          height: 400.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: crosstart,
              children: <Widget>[
                Center(
                    child: SizedBox(
                        width: 150.w,
                        child: const Divider(
                          thickness: 5,
                          color: greyColor,
                        ))),
                30.heightBox,
                CustomText(
                    text: 'Forgot password',
                    fontSize: 24.sp,
                    color: blackcolor,
                    fontWeight: FontWeight.w900),
                const SizedBox(height: 10),
                CustomText(
                  text:
                      'Enter your email for the verification proccesss, we will send 6 digits code to your email.',
                  fontSize: 14.sp,
                  color: textfieldgrey,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    labelText: "Enter Email",
                    hintText: "abdul@gmail.com",
                    controller: emailContorller.value,
                    validator: Validators.emailValidator),
                40.heightBox,
                CustomButton(text: "Continue", onPressed: () {})
              ],
            ),
          ),
        );
      },
    );
  }

  //show model bottom sheet for new password
  void showModalSheetForNewPassword(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: whitecolor,
          ),
          padding: const EdgeInsets.all(16.0),
          height: 400.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: crosstart,
              children: <Widget>[
                Center(
                    child: SizedBox(
                        width: 150.w,
                        child: const Divider(
                          thickness: 5,
                          color: greyColor,
                        ))),
                20.heightBox,
                CustomText(
                    text: 'Reset Password',
                    fontSize: 24.sp,
                    color: blackcolor,
                    fontWeight: FontWeight.w900),
                const SizedBox(height: 10),
                CustomText(
                  text:
                      'Set the new password for your account so you can login and access all the feature.',
                  fontSize: 14.sp,
                  color: textfieldgrey,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(height: 10),
                CustomTextFieldForPassword(
                    labelText: "Enter Password",
                    hintText: "********",
                    controller: passwordContorller.value,
                    validator: Validators.validatePassword),
                20.heightBox,
                CustomTextFieldForPassword(
                    labelText: "Enter Confirm Password",
                    hintText: "********",
                    controller: confirmContorller.value,
                    validator: Validators.validatePassword),
                20.heightBox,
                CustomButton(text: "Continue", onPressed: () {})
              ],
            ),
          ),
        );
      },
    );
  }

  final pinputController = TextEditingController().obs;
  OtpTimerButtonController controller = OtpTimerButtonController();
  final formKey = GlobalKey<FormState>();

  //show model bottom sheet for otp
  void showModalSheetForOtp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: whitecolor,
            ),
            padding: const EdgeInsets.all(16.0),
            height: 400.h,
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: crosstart, children: <Widget>[
                  Center(
                      child: SizedBox(
                          width: 150.w,
                          child: const Divider(
                            thickness: 5,
                            color: greyColor,
                          ))),
                  20.heightBox,
                  CustomText(
                      text: 'Enter 6 Digits Code',
                      fontSize: 24.sp,
                      color: blackcolor,
                      fontWeight: FontWeight.w900),
                  const SizedBox(height: 10),
                  CustomText(
                    text: 'Enter 6 digits code that received on your email.',
                    fontSize: 14.sp,
                    color: textfieldgrey,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 20),
                  Pinput(
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 45,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: textfieldgrey),
                        ),
                      ),
                      controller: pinputController.value,
                      length: 6,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        // controller.verifyOtp();
                      },
                      cursor: Column(
                        mainAxisAlignment: mainend,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                          ),
                        ],
                      )),
                  20.heightBox,
                  Center(
                    child: OtpTimerButton(
                      buttonType: ButtonType.text_button,
                      controller: controller,
                      onPressed: () {},
                      text: const Text('Resend OTP'),
                      duration: 60,
                    ),
                  ),
                  20.heightBox,
                  CustomButton(text: "Continue", onPressed: () {})
                ])));
      },
    );
  }

  AuthRepository authRepository = AuthRepository();

  //signin Api
  Future signInUser() async {
    await authRepository.signIn(SignInPostModel(
        email: emailContorller.value.text.toString().trim(),
        password: passwordContorller.value.text.toString().trim()));
  }

  final formkey = GlobalKey<FormState>();
}
