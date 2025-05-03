import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:patient_management/app/data/getModels/admin/getAllStatuses.dart';
import 'package:patient_management/app/data/getModels/notifications/getNotifications.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class AdminRepository {
  Future<GetAllStatusesModel> fetchAllStatusesForAdmin() async {
    try {
      final response = await http.get(Uri.parse(getAllStatusesUrl), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return GetAllStatusesModel.fromMap(data);
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Error fetching doctors: $e');
    }
  }

  Future<GetNotificationsModel> getAllNotifications() async {
    try {
      final response = await http
          .get(Uri.parse("$baseUrl/admin/read_notification"), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return GetNotificationsModel.fromJson(data);
      } else {
        throw Exception('Failed to load notificaions');
      }
    } catch (e) {
      throw Exception('Error fetching notificaions: $e');
    }
  }

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
      icdCodeId,
      docid}) async {
    final url = Uri.parse(createPatientUrlByAdmin);

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer ${sharedPrefbox.read(userToken)}"
        },
        body: jsonEncode({
          "doctor_id": docid,
          "first_name": firstName,
          "last_name": lastName,
          "mi": mi,
          "pruner_notification_sent": prunerNotificationSent,
          "date_disconnect": datedisconnect,
          "date_pruning_completed": datePruningCompleted,
          "dob": dob,
          "date_payment_received": datePaymentReceived,
          "folders_created": folderscreated,
          "report_faxed": faxed,
          "date_pruner_paid": datePrunerPaid,
          "date_hookup": dateHookup,
          "rescheduled_date_setup": rescheduledDateSetup,
          "rescheduled_date_disconnect": rescheduledDateDisconnect,
          "requesting_physician": requestingPhysician,
          "primary_insurance": primaryInsurance,
          "secondary_insurance": secondaryInsurance,
          "medicaid": medicaid,
          "hrs": hrs,
          "date_received": dateRecieved,
          "continuous_intermittent": continuousIntermittent,
          "sex": sex,
          "status": status,
          "rescheduled_reason": rescheduledReason,
          "read_packet_to_dr": readPacketToDr,
          "medications": medications,
          "location": location,
          "contact_number": contactNumber,
          "setup_technician": setupTechnician,
          "disconnect_technician": disconnectTechnician,
          "pre_auth_ref_nbr": preAuthRefNbr,
          "sbill_submitted": sbillSubmitted,
          "professional_component": professionalComponent,
          "professional_component_practice": professionalComponentPractice,
          "pruning_technician": pruningTechnician,
          "patient_journal": patientJournal,
          "carrier": carrier,
          "street_address": streetAddress,
          "city": city,
          "state": state,
          "zip": zip,
          "monitoring_shift": monitoringShift,
          "invoice": invoice,
          "amount_received": amountReceived,
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
}
