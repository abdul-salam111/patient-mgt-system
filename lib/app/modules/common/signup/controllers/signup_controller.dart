import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final fullNameController=TextEditingController().obs;
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  final retypePasswordController=TextEditingController().obs;
}
