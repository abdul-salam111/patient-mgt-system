import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customAppBar.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customFielddropdown.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/create_patient_controller.dart';

class CreatePatientView extends GetView<CreatePatientController> {
  const CreatePatientView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CreatePatientController());
    return Scaffold(
        appBar: customAppBar(title: "Edit Patient", center: true),
        body: Padding(
          padding: pad14,
          child: Form(
            key: controller.formkey,
            child: ListView(
              children: [
                customFieldDropDown(
                    hintttext: controller.selectedTitle,
                    valuesList: controller.title),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "First Name",
                    controller: controller.firstNameController.value,
                    validator: Validators.validation("First Name")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Last Name",
                    controller: controller.lastNameController.value,
                    validator: Validators.validation("Last Name")),
                20.heightBox,
                customFieldDropDown(
                    hintttext: controller.selectedSex,
                    valuesList: controller.gender),
                20.heightBox,
                Obx(
                  () => TextFormField(
                    readOnly: true,
                    onTap: () {
                      controller.selectDate(
                          context, controller.dateOfBirthController.value);
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Date cannot be empty";
                      }
                      return null;
                    },
                    style: const TextStyle(color: textfieldgrey),
                    controller: controller.dateOfBirthController.value,
                    decoration: InputDecoration(
                      hintText:
                          controller.dateOfBirthController.value.text.isNotEmpty
                              ? controller.formattedDate
                              : "Date of birth",
                      hintStyle: const TextStyle(color: textfieldgrey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                        borderSide: const BorderSide(color: textfieldgrey),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "MI",
                    controller: controller.miController.value,
                    validator: Validators.validation("MI")),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.dateRecievedController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Date cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.dateRecievedController.value,
                //     decoration: InputDecoration(
                //       hintText: controller
                //               .dateRecievedController.value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Date Recieved",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Requesting Physician",
                    controller: controller.requestingPhysicianController.value,
                    validator: Validators.validation("Requesting Physician")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Primary Insurance",
                    controller: controller.primaryInsuranceController.value,
                    validator: Validators.validation("Primary Insurance")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Secondary Insurance",
                    controller: controller.secondaryInsuranceController.value,
                    validator: Validators.validation("Secondary Insurance")),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.dateHookupController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Date hookup cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.dateHookupController.value,
                //     decoration: InputDecoration(
                //       hintText:
                //           controller.dateHookupController.value.text.isNotEmpty
                //               ? controller.formattedDate
                //               : "Date Hookup",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.dateDisconnectController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Date Disconnect cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.dateDisconnectController.value,
                //     decoration: InputDecoration(
                //       hintText: controller
                //               .dateDisconnectController.value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Date Diconnect",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,

                customFieldDropDown(
                    hintttext: controller.selectedMedicaid,
                    valuesList: controller.medicaid),
                20.heightBox,
                customFieldDropDown(
                    hintttext: controller.selectedHrs,
                    valuesList: controller.hrs),
                20.heightBox,
                Obx(() {
                  return Stack(
                    children: [
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: controller.selectedICDs.isEmpty
                              ? "Select ICD"
                              : controller.selectedICDs.join(', '),
                          hintStyle: const TextStyle(color: textfieldgrey),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: textfieldgrey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greyColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 10, top: 0),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 0,
                        bottom: 0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: whitecolor,
                            icon: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Image.asset(
                                  "assets/icons/dropdown.png",
                                  height: 13,
                                  width: 13,
                                )),
                            items: controller.iCDS.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    CustomText(
                                      color: textfieldgrey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.sp,
                                      text: value,
                                    ),
                                    controller.selectedICDs.contains(value)
                                        ? const Icon(
                                            Icons.done,
                                            color: greencolor,
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              if (newValue != null) {
                                if (controller.selectedICDs
                                    .contains(newValue)) {
                                  controller.selectedICDs.remove(newValue);
                                } else {
                                  controller.selectedICDs.add(newValue);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Continuous/Intermittent",
                //     controller:
                //         controller.continuesIntermitttentController.value,
                //     validator:
                //         Validators.validation("Continuous/Intermittent")),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Rescheduled Reason",
                //     controller: controller.rescheduledReasonController.value,
                //     validator: Validators.validation("Rescheduled Reason")),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.readPacketToDrController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Read Packet to Dr";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.readPacketToDrController.value,
                //     decoration: InputDecoration(
                //       hintText: controller
                //               .readPacketToDrController.value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Read Packet to Dr",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.reportFaxedController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Report Faxed cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.reportFaxedController.value,
                //     decoration: InputDecoration(
                //       hintText:
                //           controller.reportFaxedController.value.text.isNotEmpty
                //               ? controller.formattedDate
                //               : "Report Faxed",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Medications",
                    controller: controller.medicationsController.value,
                    validator: Validators.validation("Medications")),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Location",
                //     controller: controller.locationController.value,
                //     validator: Validators.validation("Location")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Contact Number",
                    controller: controller.contactNumberController.value,
                    validator: Validators.validation("Contact Number")),
                // 20.heightBox,

                // CustomTextFieldForPatient(
                //     hintText: "Disconnect Technician",
                //     controller: controller.disconnectTechnicianController.value,
                //     validator: Validators.validation("Disconnect Technician")),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Pre Auth Ref Nbr",
                //     controller: controller.preAuthRefController.value,
                //     validator: Validators.validation("Pre Auth Ref Nbr")),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.sbillSubmittedController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Sbill Submitted cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.sbillSubmittedController.value,
                //     decoration: InputDecoration(
                //       hintText: controller
                //               .sbillSubmittedController.value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Sbill Submitted",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Professional Component",
                //     controller:
                //         controller.professionalComponentController.value,
                //     validator: Validators.validation("Professional Component")),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Professional Component Practice",
                //     controller: controller
                //         .professionalComponentPracticeController.value,
                //     validator: Validators.validation(
                //         "Professional Component Practice")),
                // 20.heightBox,
                // CustomTextFieldForPatient(
                //     hintText: "Pruning Technician",
                //     controller: controller.pruningTechnicianController.value,
                //     validator: Validators.validation("Pruning Technician")),
                //20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(context,
                //           controller.datePruningCompletedController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Date Pruning Completed cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.datePruningCompletedController.value,
                //     decoration: InputDecoration(
                //       hintText: controller.datePruningCompletedController.value
                //               .text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Date Pruning Completed",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(context,
                //           controller.rescheduledDateSetupController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Rescheduled date setup cannot be empty";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.rescheduledDateSetupController.value,
                //     decoration: InputDecoration(
                //       hintText: controller.rescheduledDateSetupController.value
                //               .text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Rescheduled Date Setup",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(context,
                //           controller.rescheduledDateDisconnectController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Rescheduled date disconnect cannot be empty.";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller:
                //         controller.rescheduledDateDisconnectController.value,
                //     decoration: InputDecoration(
                //       hintText: controller.rescheduledDateDisconnectController
                //               .value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Rescheduled Date Disconnect",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(context,
                //           controller.datePaymentReceivedController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Date payment recieved cannot be empty.";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.datePaymentReceivedController.value,
                //     decoration: InputDecoration(
                //       hintText: controller.datePaymentReceivedController.value
                //               .text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Date Payment Recieved",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // customFieldDropDown(
                //     hintttext: controller.selectedJournal,
                //     valuesList: controller.journal),
                // 20.heightBox,
                // customFieldDropDown(
                //     hintttext: controller.selectedFolder,
                //     valuesList: controller.folders),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(context,
                //           controller.prunerNotificationSentController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Pruner Notification Sent";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller:
                //         controller.prunerNotificationSentController.value,
                //     decoration: InputDecoration(
                //       hintText: controller.prunerNotificationSentController
                //               .value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Pruner Notification Sent",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),
                // 20.heightBox,
                // Obx(
                //   () => TextFormField(
                //     readOnly: true,
                //     onTap: () {
                //       controller.selectDate(
                //           context, controller.datePrunerPaidController.value);
                //     },
                //     validator: (val) {
                //       if (val!.isEmpty) {
                //         return "Date Pruner Paid cannot be empty.";
                //       }
                //       return null;
                //     },
                //     style: const TextStyle(color: textfieldgrey),
                //     controller: controller.datePrunerPaidController.value,
                //     decoration: InputDecoration(
                //       hintText: controller
                //               .datePrunerPaidController.value.text.isNotEmpty
                //           ? controller.formattedDate
                //           : "Date Pruner Paid",
                //       hintStyle: const TextStyle(color: textfieldgrey),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(
                //             8.0), // Adjust the radius as needed
                //         borderSide: const BorderSide(color: textfieldgrey),
                //       ),
                //       enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: greyColor,
                //         ),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderSide: BorderSide(color: greyColor),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //       ),
                //       contentPadding: const EdgeInsets.only(left: 10),
                //     ),
                //   ),
                // ),

                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Street Address",
                    controller: controller.streetAddressController.value,
                    validator: Validators.validation("Street Address")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "City",
                    controller: controller.cityController.value,
                    validator: Validators.validation("City")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "State",
                    controller: controller.stateController.value,
                    validator: Validators.validation("State")),
                20.heightBox,
                CustomTextFieldForPatient(
                    hintText: "Zip",
                    controller: controller.zipController.value,
                    validator: Validators.validation("Zip")),

                20.heightBox,
                CustomButton(
                    text: "Next",
                    onPressed: () {
                      controller.createNewPatient();
                    }),
                20.heightBox,
              ],
            ),
          ),
        ));
  }
}
