import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_management/app/data/getModels/admin/getAllStatuses.dart'
    as status;
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart';
import 'package:patient_management/app/data/getModels/technician/getTechnicianModel.dart'
    as technician;
import 'package:patient_management/app/repositories/admin/adminRepository.dart';
import 'package:patient_management/app/repositories/patient/patientRepository.dart';
import 'package:patient_management/app/repositories/technician/technician.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class AllPatientsController extends GetxController {
  var selectedStatus = 'Status'.obs;
  var statusesList = <status.Status>[].obs;

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

  var selectedDate = DateTime.now().obs;
  void selectDate(
      BuildContext context, TextEditingController texteditingcontroller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      texteditingcontroller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  String get formattedDate {
    return DateFormat('yyyy-MM-dd').format(selectedDate.value);
  }

  final setupdate = TextEditingController().obs;
  final disconnectdate = TextEditingController().obs;
  var setupTechnician = "".obs;
  var disconnectTechnician = "".obs;
  var pruningTechnician = "".obs;
  TechnicianRepository technicianRepository = TechnicianRepository();
  PatientRepository patientRepository = PatientRepository();
  void showPopupMenu(BuildContext context, Payload patient) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
            color: whitecolor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            10.heightBox,
            Container(
              width: 100.w,
              height: 3.h,
              color: greyColor,
            ).box.rounded.make(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: mainend,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: statusesList.map((status) {
                    return ListTile(
                      title: Text(status.name),
                      onTap: () {
                        if (status.name == "Scheduled" ||
                            status.name == "Hooked Up") {
                          Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              height: 500.h, // Adjust the height as needed
                              child: Column(
                                children: [
                                  10.heightBox,
                                  Center(
                                    child: SizedBox(
                                      height: 3.h,
                                      width: 100.w,
                                    ).box.color(greyColor).rounded.make(),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(Icons.close)),
                                  ),
                                  Row(
                                    mainAxisAlignment: mainbetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          const Text(
                                            'Setup Technician',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: blackcolor),
                                          ),
                                          5.heightBox,
                                          Obx(
                                            () => Text(
                                              setupTechnician.value,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: blackcolor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          const Text(
                                            'Disconnect Technician',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: blackcolor),
                                          ),
                                          5.heightBox,
                                          Obx(
                                            () => Text(
                                              disconnectTechnician.value,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: blackcolor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: technicianModel
                                                    .value
                                                    .payload!
                                                    .length, // Replace with your first list length
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    onTap: () {
                                                      setupTechnician.value =
                                                          technicianModel
                                                              .value
                                                              .payload![index]
                                                              .name!;
                                                    },
                                                    tileColor: technicianModel
                                                                .value
                                                                .payload![index]
                                                                .name ==
                                                            setupTechnician
                                                                .value
                                                        ? greyColor
                                                        : whitecolor,
                                                    title: Text(technicianModel
                                                        .value
                                                        .payload![index]
                                                        .name!),
                                                    // Add your logic for the first list items
                                                  );
                                                },
                                              ),
                                              20.heightBox,
                                              const Text(
                                                "Setup Date",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              20.heightBox,
                                              Obx(
                                                () => TextFormField(
                                                  readOnly: true,
                                                  onTap: () {
                                                    selectDate(context,
                                                        setupdate.value);
                                                  },
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Date cannot be empty";
                                                    }
                                                    return null;
                                                  },
                                                  style: const TextStyle(
                                                      color: textfieldgrey),
                                                  controller: setupdate.value,
                                                  decoration: InputDecoration(
                                                    hintText: setupdate.value
                                                            .text.isNotEmpty
                                                        ? formattedDate
                                                        : "Setup Date",
                                                    hintStyle: const TextStyle(
                                                        color: textfieldgrey),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Adjust the radius as needed
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  textfieldgrey),
                                                    ),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: greyColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: greyColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const VerticalDivider(
                                          width: 16.0,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: technicianModel
                                                    .value.payload!.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                      onTap: () {
                                                        disconnectTechnician
                                                                .value =
                                                            technicianModel
                                                                .value
                                                                .payload![index]
                                                                .name!;
                                                      },
                                                      tileColor: technicianModel
                                                                  .value
                                                                  .payload![
                                                                      index]
                                                                  .name ==
                                                              disconnectTechnician
                                                                  .value
                                                          ? greyColor
                                                          : whitecolor,
                                                      title: Text(
                                                          technicianModel
                                                              .value
                                                              .payload![index]
                                                              .name!));
                                                },
                                              ),
                                              20.heightBox,
                                              const Text(
                                                "Disconnect Date",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              20.heightBox,
                                              Obx(
                                                () => TextFormField(
                                                  readOnly: true,
                                                  onTap: () {
                                                    selectDate(context,
                                                        disconnectdate.value);
                                                  },
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Date cannot be empty";
                                                    }
                                                    return null;
                                                  },
                                                  style: const TextStyle(
                                                      color: textfieldgrey),
                                                  controller:
                                                      disconnectdate.value,
                                                  decoration: InputDecoration(
                                                    hintText: disconnectdate
                                                            .value
                                                            .text
                                                            .isNotEmpty
                                                        ? formattedDate
                                                        : "Disconnect Date",
                                                    hintStyle: const TextStyle(
                                                        color: textfieldgrey),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0), // Adjust the radius as needed
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  textfieldgrey),
                                                    ),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: greyColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: greyColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                        onPressed: () {
                                          if (setupTechnician.value != "" &&
                                              disconnectTechnician.value !=
                                                  "" &&
                                              disconnectdate
                                                  .value.text.isNotEmpty &&
                                              setupdate.value.text.isNotEmpty) {
                                            Get.back();
                                            Get.back();
                                            patientRepository
                                                .updatePatientStatus(
                                                    patient.id!,
                                                    status.name,
                                                    setupTechnician.value,
                                                    disconnectTechnician.value,
                                                    disconnectdate.value.text
                                                        .trim(),
                                                    setupdate.value.text.trim(),
                                                    "")
                                                .then((val) {
                                              fetchAllPateints();
                                            });
                                          }
                                        },
                                        child: const Text(
                                          "Confirm",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 47, 126, 49)),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            isScrollControlled: true,
                          );
                        } else if (status.name == "Pruning") {
                          Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              height: 400.h, // Adjust the height as needed
                              child: Column(
                                children: [
                                  10.heightBox,
                                  Center(
                                    child: SizedBox(
                                      height: 3.h,
                                      width: 100.w,
                                    ).box.color(greyColor).rounded.make(),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(Icons.close)),
                                  ),
                                  Column(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      const Text(
                                        'Pruning Technician',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: blackcolor),
                                      ),
                                      5.heightBox,
                                      Obx(
                                        () => Text(
                                          pruningTechnician.value,
                                          style: const TextStyle(
                                              fontSize: 14, color: blackcolor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: technicianModel.value.payload!
                                          .length, // Replace with your first list length
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            pruningTechnician.value =
                                                technicianModel.value
                                                    .payload![index].name!;
                                          },
                                          tileColor: technicianModel.value
                                                      .payload![index].name ==
                                                  pruningTechnician.value
                                              ? greyColor
                                              : whitecolor,
                                          title: Text(technicianModel
                                              .value.payload![index].name!),
                                          // Add your logic for the first list items
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                        onPressed: () {
                                          if (pruningTechnician.value != "") {
                                            Get.back();
                                            Get.back();
                                            patientRepository
                                                .updatePatientStatus(
                                                    patient.id!,
                                                    status.name,
                                                    "",
                                                    "",
                                                    pruningTechnician.value,
                                                    "",
                                                    "")
                                                .then((val) {
                                              fetchAllPateints();
                                            });
                                          }
                                        },
                                        child: const Text(
                                          "Confirm",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 47, 126, 49)),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            isScrollControlled: true,
                          );
                        } else {
                          Get.back();
                          patientRepository
                              .updatePatientStatus(
                                  patient.id!, status.name, "", "", "", "", "")
                              .then((val) {
                            fetchAllPateints();
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  var isLoading = false.obs;
  var technicianModel = technician.GetTechnicianModel().obs;

  var getAllPateintModel = GetAllPatient().obs;
  Future fetchAllPateints() async {
    try {
      isLoading.value = true;
      getAllPateintModel.value =
          await patientRepository.fetchAllPatientsForAdmin();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }

  var isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAllPateints();
    fetchAllStatuses();
    fetchAllTechnicians();
  }

  Future fetchAllTechnicians() async {
    try {
      isloading.value = true;
      technicianModel.value = await technicianRepository.fetchTechnicians();
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  AdminRepository adminRepository = AdminRepository();
  var getAllStatusesModel = status.GetAllStatusesModel().obs;
  RxList<Payload> tempPayload = <Payload>[].obs;
  Future<status.GetAllStatusesModel> fetchAllStatuses() async {
    try {
      getAllStatusesModel.value =
          await adminRepository.fetchAllStatusesForAdmin();
      final response = await adminRepository.fetchAllStatusesForAdmin();
      statusesList.value = response.statuses!;
      return await adminRepository.fetchAllStatusesForAdmin();
      // return statusesList.value = getAllStatusesModel.value;
    } catch (e) {
      throw Exception(e);
    }
  }
}
