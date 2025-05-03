import 'dart:convert';

import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/doctor/getPatientsByDoctor.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPatientsForTechnicians.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class PatientRepository {
  Future<GetAllPatient> fetchPateints() async {
    try {
      final response = await http.get(Uri.parse(getAllPatientsUrl), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return GetAllPatient.fromJson(data);
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  //fetch all the patients and show on dashboard screen
  Future<GetAllPatient> fetchAllPatientsForAdmin() async {
    try {
      final response =
          await http.get(Uri.parse(getAllPatientForAdminUrl), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return GetAllPatient.fromJson(data);
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  Future<GetAllPatientsByDoctor> fetchAllPatientsByDoctor() async {
    try {
      final response =
          await http.get(Uri.parse(getAllPatientsByDoctorUrl), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return GetAllPatientsByDoctor.fromJson(data);
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

//admin can update the patient status on dasboard or on all patient screen
  Future<void> updatePatientStatus(
    int patientId,
    String status,
    String? setupTechnician,
    String? disconnetTechnician,
    String? disconnectDate,
    String? setupDate,
    String? pruningTechnician,
  ) async {
    final url = Uri.parse(updatePatientStatusByAdminUrl);
    final response = await http.post(url, body: {
      'patient_id': patientId.toString(),
      'status': status,
      'setup_technician': setupTechnician,
      'disconnect_technician': disconnetTechnician,
      "pruning_technician": pruningTechnician,
      "date_disconnect": "",
      "date_hookup": "",
    }, headers: {
      "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (response.statusCode == 200) {
      Utils.snakbar(
          title: "Status Updated", body: "Patient status updated successfully");
    } else {
      Utils.snakbar(title: "Error", body: "Failed to update patient status");
    }
  }

  //fetch all the patients for technicians and show on dashboard screen
  Future<GetAllPatientsForTechnicians> fetchAllPatientsForTechnicians() async {
    try {
      final response =
          await http.get(Uri.parse(getAllPatientsForTechnicians), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return GetAllPatientsForTechnicians.fromJson(data);
      } else {
        throw Exception('Failed to load patients');
      }
    } catch (e) {
      throw Exception('Failed to load patients: $e');
    }
  }

//update patient status by technicians
  Future<void> updatePatientStatusByTechnicians(
      String status, String patientId) async {
    final token =
        sharedPrefbox.read('userToken'); // Make sure to use the correct key
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'
    };
    final body = {
      'status': status,
      'patient_id': patientId,
    };

    try {
      final response = await http.post(
        Uri.parse(
            "https://patientmanagement.saeedantechpvt.com/api/technician/patients/update/status"),
        headers: headers,
        body: body,
        // Redirect handling: follow redirects manually if needed
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Patient status updated successfully');
      } else if (response.statusCode == 302) {
        // Handle redirect
        final redirectedUrl = response.headers['location'];
        if (redirectedUrl != null) {
          final redirectResponse = await http.post(
            Uri.parse(redirectedUrl),
            headers: headers,
            body: body,
          );

          if (redirectResponse.statusCode == 200) {
            Get.snackbar('Success', 'Patient status updated successfully');
          } else {
            // Get.snackbar('Error', 'Failed to update status. Status code: ${}');
          }
        } else {
          // Get.snackbar('Error', );
        }
      } else {}
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  //fetch all the patients for staff
  Future<dynamic> fetchAllPatientsForStaff() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://patientmanagement.saeedantechpvt.com/api/staff/patients"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
          });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return GetAllPatient.fromJson(data);
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }
}
