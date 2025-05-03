import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_management/app/data/getModels/admin/getAllStatuses.dart';
import 'package:patient_management/app/data/getModels/doctor/getAllDoctorsModel.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart'
    as patient;
import 'package:patient_management/app/data/getModels/technician/getTechnicianModel.dart'
    as technician;
import 'package:patient_management/app/repositories/admin/adminRepository.dart';
import 'package:patient_management/app/repositories/doctor/doctorRespository.dart';
import 'package:patient_management/app/repositories/patient/patientRepository.dart';
import 'package:patient_management/app/repositories/technician/technician.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardController extends GetxController {
  var selectedStatus = 'Status'.obs;
  AdminRepository adminRepository = AdminRepository();
  var statusesList = <Status>[].obs; // Observable list of Status objects

  var getAllSatusesForAdmin = GetAllStatusesModel().obs;

  void updateStatus(String status) {
    selectedStatus.value = status;
  }

  var setupTechnician = "".obs;
  var disconnectTechnician = "".obs;
  var pruningTechnician = "".obs;
  RxList<patient.Payload> tempPatientsList = <patient.Payload>[].obs;
  RxList<Payload> tempDoctorsList = <Payload>[].obs;
  TechnicianRepository technicianRepository = TechnicianRepository();
  PatientRepository patientRepository = PatientRepository();
  var technicianModel = technician.GetTechnicianModel().obs;
  final setupdate = TextEditingController().obs;
  final disconnectdate = TextEditingController().obs;

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

  void showPopupMenu(BuildContext context, patient.Payload patient) {
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
                                              Obx(
                                                () => SizedBox(
                                                  height: 200,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: technicianModel
                                                        .value
                                                        .payload!
                                                        .length, // Replace with your first list length
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        onTap: () {
                                                          setupTechnician
                                                                  .value =
                                                              technicianModel
                                                                  .value
                                                                  .payload![
                                                                      index]
                                                                  .name!;
                                                        },

                                                        title: Text(technicianModel
                                                            .value
                                                            .payload![index]
                                                            .name!), // No widget when the condition is false
                                                        // Add your logic for the first list items
                                                      );
                                                    },
                                                  ),
                                                ),
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
                                              SizedBox(
                                                height: 200,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: technicianModel
                                                      .value.payload!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                        onTap: () {
                                                          disconnectTechnician
                                                                  .value =
                                                              technicianModel
                                                                  .value
                                                                  .payload![
                                                                      index]
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

  var getAllDoctorsModel = GetAllDoctorsModel().obs;

  var isloading = false.obs;

  DoctorRepsitory doctorRepsitory = DoctorRepsitory();
  Future fetchAlldoctors() async {
    try {
      isloading.value = true;
      getAllDoctorsModel.value = await doctorRepsitory.fetchDoctors();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  var getAllPateintModel = patient.GetAllPatient().obs;
  var getAllStatusesModel = GetAllStatusesModel().obs;

  Future<patient.GetAllPatient> fetchAllPateints() async {
    try {
      isloading.value = true;
      getAllPateintModel.value =
          await patientRepository.fetchAllPatientsForAdmin();

      return getAllPateintModel.value;
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  var setupTechnicians = [].obs;
  var disconnectTechnicians = [].obs;
  var pruningTechnicians = [].obs;
  Future fetchAllTechnicians() async {
    try {
      isloading.value = true;
      technicianModel.value = await technicianRepository.fetchTechnicians();
      // setupTechnicians.addAll(
      //   technicianModel.value.payload!
      //       .map((e) => e.type![0].type == "setup technician" ? e.name : null)
      //       .where((name) => name != null),
      // );
      // print(technicianModel.value.payload!.map((e) => e.type != null
      //     ? e.type![0].type == "disconnect technician"
      //         ? e.name
      //         : null
      //     : e.name));
      // disconnectTechnicians.addAll(
      //   technicianModel.value.payload!
      //       .map((e) =>
      //           e.type![0].type == "disconnect technician" ? e.name : null)
      //       .where((name) => name != null), // This will remove any null values
      // );
      // pruningTechnicians.addAll(
      //   technicianModel.value.payload!
      //       .map((e) => e.type![0].type == "pruning technician" ? e.name : null)
      //       .where((name) => name != null), // This will remove any null values
      // );
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  Future<GetAllStatusesModel> fetchAllStatuses() async {
    try {
      isloading.value = true;
      getAllStatusesModel.value =
          await adminRepository.fetchAllStatusesForAdmin();
      final response = await adminRepository.fetchAllStatusesForAdmin();
      statusesList.value = response.statuses!;
      return await adminRepository.fetchAllStatusesForAdmin();
      // return statusesList.value = getAllStatusesModel.value;
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAlldoctors();
    fetchAllPateints();
    fetchAllStatuses();
    fetchAllTechnicians();
  }
}
