import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:patient_management/app/data/getModels/doctor/getAllDoctorsModel.dart';
import 'package:patient_management/app/data/postModels/doctor/createDoctorModel.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class DoctorRepsitory {
  //create patient )-> the patient will be created by doctors
  Future<void> createPatient(
      {firstName,
      lastName,
      mi,
      prunerNotificationSent,
      datedisconnect,
      datePruningCompleted,
      dob,
      datePaymentReceived,
      folderscreated,
      faxed,
      datePrunerPaid,
      dateHookup,
      rescheduledDateSetup,
      rescheduledDateDisconnect,
      requestingPhysician,
      practiceId,
      primaryInsurance,
      secondaryInsurance,
      medicaid,
      hrs,
      dateRecieved,
      continuousIntermittent,
      sex,
      status,
      rescheduledReason,
      readPacketToDr,
      medications,
      location,
      contactNumber,
      setupTechnician,
      disconnectTechnician,
      preAuthRefNbr,
      sbillSubmitted,
      professionalComponent,
      professionalComponentPractice,
      pruningTechnician,
      patientJournal,
      carrier,
      streetAddress,
      city,
      state,
      zip,
      monitoringShift,
      invoice,
      amountReceived,
      icdCodeId}) async {
    final url = Uri.parse(createPatientUrl);

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${sharedPrefbox.read(userToken)}"
        },
        body: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "mi": mi,
          "dob": dob,
          "requesting_physician": requestingPhysician,
          "practice_id": practiceId,
          "primary_insurance": primaryInsurance,
          "secondary_insurance": secondaryInsurance,
          "medicaid": medicaid,
          "hrs": hrs,
          "date_received": dateRecieved,
          "sex": sex,
          "medications": medications,
          "contact_number": contactNumber,
          "patient_journal": patientJournal,
          "street_address": streetAddress,
          "city": city,
          "state": state,
          "zip": zip,
          "icd_code_id": icdCodeId,
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Patient created!", body: "Patient created successfully");
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw Exception(e);
    }
  }

  //get all doctors to show to admin on admin dashboard
  Future<GetAllDoctorsModel> fetchDoctors() async {
    try {
      final response = await http.get(Uri.parse(getAllDoctorsUrl), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return GetAllDoctorsModel.fromJson(data);
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

//Update doctors permission whether they can fill the form or not.
  Future updateFormStatus(int id, int fillOutForm) async {
    final url = Uri.parse(updateDoctorPermission);
    final response = await http.post(url, body: {
      'id': id.toString(),
      'fill_out_form': fillOutForm.toString(),
    }, headers: {
      "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (response.statusCode == 200) {
      Utils.snakbar(title: "Status Updated", body: "");
      // fetchDoctors();
    } else {
      throw Exception(response.body);
    }
  }

  //create new Doctor created by admin on add new doctor
  Future createNewDoctor(CreateNewDoctor createDoctorModel) async {
    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(
        Uri.parse(createdoctorUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${sharedPrefbox.read(userToken)}" // Ensure this token is correctly fetched
        },
        body: jsonEncode(createDoctorModel.toJson()),
      );

      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Doctor Added!",
            body: "${createDoctorModel.name} is successfully created");
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();

        throw Exception('Failed to create practice${response.body}');
      }
    } catch (e) {
      EasyLoading.dismiss();

      throw Exception('Error creating practice: $e');
    }
  }
}
