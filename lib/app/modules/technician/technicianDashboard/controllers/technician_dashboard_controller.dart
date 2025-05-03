import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPatientsForTechnicians.dart';
import 'package:patient_management/app/repositories/patient/patientRepository.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class TechnicianDashboardController extends GetxController {
  var selectedStatus = 'Status'.obs;

  List<String> statuses = ["Disconnected", "Hooked Up"];
  void updateStatus(String status) {
    selectedStatus.value = status;
  }

  var getallpatients = GetAllPatientsForTechnicians().obs;

  void showPopupMenu(BuildContext context, int index) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: statuses.map((status) {
            return ListTile(
              title: Text(status),
              onTap: () {
                final patient = getallpatients.value.payload![index];
                patientRepository
                    .updatePatientStatusByTechnicians(
                        status, patient.id.toString())
                    .then((val) async {
                  await fetchAllPatients();
                });

                Get.back();
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  RxList<Payload> tempList = <Payload>[].obs;
  var isloading = false.obs;
  PatientRepository patientRepository = PatientRepository();

  Future<GetAllPatientsForTechnicians> fetchAllPatients() async {
    try {
      isloading.value = true;
      getallpatients.value =
          await patientRepository.fetchAllPatientsForTechnicians();
      isloading.value = false;

      return await patientRepository.fetchAllPatientsForTechnicians();
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  Future<void> changeStatusToPruning(
      String patientId, String patientName) async {
    final url =
        "https://patientmanagement.saeedantechpvt.com/api/technician/patients/pruning/$patientId";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${sharedPrefbox.read('userToken')}",
        },
      );

      if (response.statusCode == 200) {
        Utils.snakbar(title: "Pruning Completed", body: "For $patientName!");
        fetchAllPatients();
      } else {
        print('Failed to change status. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('Failed to change patient status to Pruning');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPatients();
  }

  Future changePatientStatus(
      {required String patientId,
      required String patientName,
      required String status}) async {
    try {
      final response =
          await http.post(Uri.parse(changedPatientStatusBySetupTechnician),
              body: jsonEncode({
                "status": status == "Scheduled" ? "Hooked Up" : "Disconnected",
                "patient_id": patientId
              }),
              headers: {
            "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200) {
        Utils.snakbar(
            title: patientName,
            body: status == "Scheduled"
                ? "Is successfully Hooked Up!"
                : "Is successfully disconnected!");
        fetchAllPatients();
      } else {
        Utils.snakbar(title: "Failed", body: "Something went wrong");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
