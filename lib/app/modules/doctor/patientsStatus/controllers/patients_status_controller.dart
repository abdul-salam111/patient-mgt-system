import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patient_management/app/data/getModels/status/allStatus.dart';
import 'package:patient_management/app/resources/apiKeys.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';

class PatientsStatusController extends GetxController {
  var isLoading = true.obs;
  var statusesList = <Status>[].obs;

  @override
  void onInit() {
    fetchAllStatus();
    super.onInit();
  }

  void fetchAllStatus() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(fetchAllStatusesUrl), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${sharedPrefbox.read(userToken)}"
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Status> statuses = (data['statuses'] as List)
            .map((statusJson) => Status.fromJson(statusJson))
            .toList();
        statusesList.assignAll(statuses);
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } finally {
      isLoading(false);
    }
  }

  void saveChanges(int statusId, bool viaEmail, bool viaSMS) async {
    final url = Uri.parse(updateNotifications);
    final response = await http.post(
      url,
      body: {
        'status_id': statusId.toString(),
        'email': viaEmail ? "on" : "off",
        'sms': viaSMS ? "on" : "off"
      },
      headers: {
        'Authorization': 'Bearer ${sharedPrefbox.read('userToken')}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      Utils.snakbar(
        title: "Status Updated",
        body: "Patient status updated successfully",
      );
    } else {
      Utils.snakbar(
        title: "Error",
        body: "Failed to update patient status",
      );
    }
  }
}
