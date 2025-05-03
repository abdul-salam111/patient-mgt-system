import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/repositories/Auth/AuthRepository.dart';

class ChangePasswordController extends GetxController {
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  AuthRepository authRepository = AuthRepository();

  Future changeUserPassword() async {
    await authRepository.changePassword(
        Get.arguments,
        passwordController.value.text.trim(),
        confirmPasswordController.value.text.trim());
  }
}
