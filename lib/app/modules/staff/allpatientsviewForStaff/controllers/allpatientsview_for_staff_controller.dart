import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart';
import 'package:patient_management/app/repositories/patient/patientRepository.dart';

class AllpatientsviewForStaffController extends GetxController {
//  var selectedStatus = 'Status'.obs;

//   List<String> statuses = [
//     "Received",
//     "ReScheduling",
//     "Scheduled",
//     "Non-Contactable",
//     "Read Availability Notification Sent",
//     "Cancelled",
//     "Disconnected",
//     "Hooked Up"
//   ];

//   void updateStatus(String status) {
//     selectedStatus.value = status;
//   }

//   Future<void> updatePatientStatus(int patientId, String status) async {
//     final url = Uri.parse(
//         'https://patientmanagement.saeedantechpvt.com/api/admin/patients/update/status');
//     final response = await http.post(url, body: {
//       'patient_id': patientId.toString(),
//       'status': status,
//     }, headers: {
//       "Authorization": "Bearer ${sharedPrefbox.read(userToken)}",
//       'Content-Type': 'application/x-www-form-urlencoded',
//     });

//     if (response.statusCode == 200) {
//       Utils.snakbar(
//           title: "Status Updated", body: "Patient status updated successfully");
//       fetchAllPateints(); // Refresh the patient list
//     } else {
//       Utils.snakbar(title: "Error", body: "Failed to update patient status");
//     }
//   }

  // void showPopupMenu(BuildContext context, int index) {
  //   Get.bottomSheet(
  //     Container(
  //       color: Colors.white,
  //       child: SingleChildScrollView(
  //         child: Wrap(
  //           children: statuses.map((status) {
  //             return ListTile(
  //               title: Text(status),
  //               onTap: () {
  //                 final patient = getAllPateintModel.value.payload![index];
  //                 updatePatientStatus(patient.id!, status);
  //                 Get.back();
  //               },
  //             );
  //           }).toList(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  var isLoading = false.obs;

  var getAllPateintModel = GetAllPatient().obs;
  PatientRepository patientRepository = PatientRepository();
  Future fetchAllPateints() async {
    try {
      isLoading.value = true;
      getAllPateintModel.value =
          await patientRepository.fetchAllPatientsForStaff();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllPateints();
  }
}
