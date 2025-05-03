import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/data/getModels/technician/getTechnicianModel.dart';
import 'package:patient_management/app/data/postModels/technician/createTechnicianModel.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class TechnicianRepository {
  //get all technician to show for admin on technician tab
  Future<GetTechnicianModel> fetchTechnicians() async {
    try {
      final response = await http.get(Uri.parse(getTechnicianforAdminUrl),
          headers: {
            "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
          });
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return GetTechnicianModel.fromJson(data);
      } else {
        throw Exception('Failed to load technicians');
      }
    } catch (e) {
      throw Exception('Failed to load technicians');
    }
  }

//create a technician  by admin
  Future<void> createTechnician(
      CreateTechnicianModel createTechnicianModel) async {
    try {
      EasyLoading.show(status: "Please Wait...");
      final response = await http.post(Uri.parse(createTechnicianforAdminUrl),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
          },
          body: jsonEncode(createTechnicianModel.toJson()));

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Technician Created ",
            body: "${createTechnicianModel.name} created as a technician.");
      } else {
        EasyLoading.dismiss();

        throw Exception('Failed to load technician ');
      }
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception('Error fetching technician: $e');
    }
  }

  //delete technician by admin
  Future<void> deleteTechnician(int userId) async {
    final url = '$deleteTechnicianByAdminUrl$userId';
    final headers = {
      'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      'Content-Type': 'application/json',
    };

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Technician deleted!",
            body: "Technician deleted successfully");
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();

        throw Exception(response.body);
      }
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception(e);
    }
  }

  //update technician by admin
  Future<void> updateTechnician({
    required int id,
    required String password,
    required String name,
    required String emails,
    required String practiceId,
    required String username,
    required String phone,
    required String date,
    required String fax,
    // Add this parameter for the auth token
  }) async {
    try {
      EasyLoading.show(status: "Please wait...");
      final url = Uri.parse(
          'https://patientmanagement.saeedantechpvt.com/api/admin/technicians/$id?password=$password&name=$name&email=$emails&practice_id=$practiceId&user_name=$username&phone=$phone&date=$date&fax=$fax');
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sharedPrefbox.read(userToken)}', // Include the auth token in the headers
        },
      );
      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "$username updated!", body: "Account updated successfully!");
        EasyLoading.dismiss();
        Get.back();
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
