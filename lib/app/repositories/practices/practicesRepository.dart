import 'dart:convert';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/data/postModels/admin/createPracticeModel.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class PracticesRepository {
//practice api, required on the new patient creating screen on the admin panel
  Future<GetAllPractices> getAllPractices() async {
    try {
      final response = await http.get(Uri.parse(getAllPracticesUrl), headers: {
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        return GetAllPractices.fromJson(data);
      } else {
        throw Exception('Failed to load practices');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//create new practice created by admin on add new doctor
  Future createPractice(CreatePracticeModel practice) async {
    try {
      final response = await http.post(
        Uri.parse(createPracticeUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${sharedPrefbox.read(userToken)}" // Ensure this token is correctly fetched
        },
        body: jsonEncode(practice.toJson()),
      );

      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Practice Added!",
            body: "${practice.name} is successfully created");
      } else {
        throw Exception('Failed to create practice');
      }
    } catch (e) {
      throw Exception('Error creating practice: $e');
    }
  }
}
