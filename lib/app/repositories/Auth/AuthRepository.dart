import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/data/postModels/doctor/signInPostModel.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:patient_management/utils/utils.dart';

class AuthRepository {
  Future<void> signIn(SignInPostModel signInData) async {
    final url = Uri.parse(loginUrl);
    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: signInData.toJson(),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        await sharedPrefbox.write(userInformation,
            signInResponseModelToJson(SignInResponseModel.fromJson(data)));
        await sharedPrefbox.write(
            userToken,
            signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                .payload!
                .token);
        EasyLoading.dismiss();
        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        Utils.snakbar(
            title: "Invalid Cridentials",
            body: "Email or Password do not match!");
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception(e);
    }
  }

  //change password api same for all users
  Future<void> changePassword(
      int userId, String password, String cpassword) async {
    final url = '$changepasswordUrl$userId';
    final headers = {
      'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      'Content-Type': 'application/json',
    };

    try {
      EasyLoading.show(status: "Please wait");
      final response = await http.post(Uri.parse(url),
          headers: headers,
          body: jsonEncode({
            "password": password,
            "c_password": cpassword,
          }));

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Password Changed", body: "Password changed successfully!");
      } else {
        EasyLoading.dismiss();
        throw Exception(response.body);
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw Exception(e);
    }
  }
}
