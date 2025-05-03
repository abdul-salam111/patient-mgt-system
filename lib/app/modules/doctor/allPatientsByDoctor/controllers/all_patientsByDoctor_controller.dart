import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/doctor/getPatientsByDoctor.dart';
import 'package:patient_management/app/repositories/patient/patientRepository.dart';
import 'package:patient_management/app/resources/storageServices.dart';

import 'package:http/http.dart' as http;
import 'package:patient_management/utils/utils.dart';

class AllPatientsByDoctorController extends GetxController {
  var selectedStatus = 'Status'.obs;
  TextEditingController searchController = TextEditingController();
  // var filteredPatients = <Patient>[].obs; // Assuming Patient is your model
  List<String> statuses = [
    "Received",
    "ReScheduling",
    "Scheduled",
    "Non-Contactable",
    "Read Availability Notification Sent",
    "Cancelled",
    "Disconnected",
    "Hooked Up"
  ];

  void updateStatus(String status) {
    selectedStatus.value = status;
  }

  Future<void> updatePatientStatus(int patientId, String status) async {
    final url = Uri.parse(
        'https://patientmanagement.saeedantechpvt.com/api/admin/patients/update/status');
    final response = await http.post(url, body: {
      'patient_id': patientId.toString(),
      'status': status,
    }, headers: {
      "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (response.statusCode == 200) {
      Utils.snakbar(
          title: "Status Updated", body: "Patient status updated successfully");
      fetchAllPateints(); // Refresh the patient list
    } else {
      Utils.snakbar(title: "Error", body: "Failed to update patient status");
    }
  }

  void showPopupMenu(BuildContext context, int index) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Wrap(
            children: statuses.map((status) {
              return ListTile(
                title: Text(status),
                onTap: () {
                  final patient =
                      getAllPateintsByDoctorModel.value.payload![index];
                  updatePatientStatus(patient.id!, status);
                  Get.back();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  var isLoading = false.obs;
  var isSearched = false.obs;
  RxList<Payload> tempList = <Payload>[].obs;
  var getAllPateintsByDoctorModel = GetAllPatientsByDoctor().obs;
  PatientRepository patientRepository = PatientRepository();
  Future fetchAllPateints() async {
    try {
      isLoading.value = true;
      getAllPateintsByDoctorModel.value =
          await patientRepository.fetchAllPatientsByDoctor();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  // void filterPatients(String query) {
  //   if (query.isEmpty) {
  //     filteredPatients.value = getAllPateintsByDoctorModel.value.payload;
  //   } else {
  //     filteredPatients.value = getAllPateintsByDoctorModel.value.patients
  //         .where((patient) =>
  //             patient.name.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    fetchAllPateints();
  }
}
