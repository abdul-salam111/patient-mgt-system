import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/doctor/getAllStaffOfDoctor.dart';
import 'package:patient_management/app/data/getModels/staff/getAllStaffModel.dart';
import 'package:patient_management/app/data/postModels/staff/createStaffModel.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class StaffRepository {
  //create a staff member by admin
  Future<void> createAStaffMember(CreateStaffModel createStaffModel) async {
    try {
      EasyLoading.show(status: "Please Wait...");
      final response = await http.post(Uri.parse(createStaffByAdminUrl),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
          },
          body: jsonEncode(createStaffModel.toJson()));

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Staff Created ",
            body: "${createStaffModel.name} created as a staff");
      } else if (response.statusCode == 400) {
        EasyLoading.dismiss();
        Utils.snakbar(
            title: "Failed to create staff! ",
            body: "${createStaffModel.email} already exist");
      } else {
        EasyLoading.dismiss();

        throw Exception('Failed to load doctors ');
      }
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception('Error fetching doctors: $e');
    }
  }

  //show staff members
  Future<GetAllStaffMembers> fetchStaff() async {
    final headers = {
      'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      'Content-Type': 'application/json',
    };

    try {
      final response =
          await http.get(Uri.parse(getAllStaffMembers), headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return GetAllStaffMembers.fromJson(data);
      } else {
        Utils.snakbar(title: 'Error', body: 'Failed to load data.');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GetAllStaffOfDoctorModel> fetchStaffByDoctor() async {
    final headers = {
      'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      'Content-Type': 'application/json',
    };

    try {
      final response =
          await http.get(Uri.parse(getAllStaffByDoctorUrl), headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return GetAllStaffOfDoctorModel.fromMap(data);
      } else {
        Utils.snakbar(title: 'Error', body: 'Failed to load data.');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //delete staff by admin
  Future<void> deleteStaffMember(int userId) async {
    final url = '$deleteStaffByAdminUrl$userId';
    final headers = {
      'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      'Content-Type': 'application/json',
    };

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Staff deleted!", body: "Staff deleted successfully");
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

  //update staff by admin
  Future<void> updateStaff({
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
          'https://patientmanagement.saeedantechpvt.com/api/admin/staffs/$id?password=$password&name=$name&email=$emails&practice_id=$practiceId&user_name=$username&phone=$phone&date=$date&fax=$fax');
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
      EasyLoading.dismiss();
      throw Exception(e);
    }
  }
}
