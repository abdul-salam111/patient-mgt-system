import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          centerTitle: true,
        ),
        body: Padding(
          padding: pad16,
          child: ListView(
            children: [
              CustomTextFieldForPassword(
                  labelText: "Password",
                  hintText: "Enter your password",
                  controller: controller.passwordController.value,
                  validator: Validators.validatePassword),
              20.heightBox,
              CustomTextFieldForPassword(
                  labelText: "Confirm Password",
                  hintText: "Enter your confirm password",
                  controller: controller.confirmPasswordController.value,
                  validator: Validators.validatePassword),
              40.heightBox,
              CustomButton(
                  text: "Change Password",
                  onPressed: () {
                    controller.changeUserPassword();
                  })
            ],
          ),
        ));
  }
}
