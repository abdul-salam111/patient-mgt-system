import 'dart:convert';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/data/postModels/admin/createCodeModel.dart';
import 'package:patient_management/app/modules/admin/Dashboard/views/dashboard_view.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/storageServices.dart';

import 'package:patient_management/utils/utils.dart';

class CodeRepository {
//practice api, required on the new patient creating screen on the admin panel
  Future<GetAllPractices> getAllPractices() async {
    try {
      final response = await http.get(Uri.parse(getAllPracticesUrl), headers: {
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetAllPractices.fromJson(data);
      } else {
        throw Exception('Failed to load practices');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//create new practice created by admin on add new doctor
  Future createCode(CreateCodeModel code) async {
    try {
      final response = await http.post(
        Uri.parse(createCodeUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${sharedPrefbox.read(userToken)}" // Ensure this token is correctly fetched
        },
        body: jsonEncode(code.toJson()),
      );

      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Code Added!", body: "${code.code} is successfully created");

        Get.to(() => const DashboardView());
      } else {
        throw Exception('Failed to create code');
      }
    } catch (e) {
      throw Exception('Error creating code: $e');
    }
  }
}
