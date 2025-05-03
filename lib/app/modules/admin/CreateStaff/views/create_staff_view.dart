import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customFielddropdown.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/create_staff_controller.dart';

class CreateStaffView extends GetView<CreateStaffController> {
  const CreateStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    var isedit = Get.arguments[1];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Add New Staff',
          fontSize: 20.sp,
          color: blackcolor,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: pad16,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            CustomTextFieldForPatient(
              textInputType: TextInputType.name,
              hintText: "Staff Name",
              controller: controller.staffNameController.value,
              validator: Validators.validation("Name"),
            ),
            10.heightBox,
            CustomTextFieldForPatient(
              textInputType: TextInputType.name,
              hintText: "Username",
              controller: controller.userNameController.value,
              validator: Validators.validation("userName"),
            ),
            10.heightBox,
            CustomTextFieldForPatient(
              textInputType: TextInputType.name,
              hintText: "Email",
              controller: controller.emailAddressController.value,
              validator: Validators.validation("Email"),
            ),
            10.heightBox,
            CustomTextFieldForPatient(
              textInputType: TextInputType.name,
              hintText: "Fax",
              controller: controller.faxController.value,
              validator: Validators.validation("Fax"),
            ),
            10.heightBox,
            Row(
              children: [
                Obx(() {
                  return Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: textfieldgrey),
                      onTap: () async {
                        Get.defaultDialog(
                          backgroundColor: Colors.white,
                          title: "Select Practice",
                          titlePadding: defaultpad,
                          contentPadding: defaultpad,
                          titleStyle: GoogleFonts.roboto(
                            color: blackcolor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          content: Obx(
                            () => controller.isloading.value != true
                                ? Padding(
                                    padding: defaultpad,
                                    child: Column(
                                      children: List.generate(
                                        controller.payload.length,
                                        (index) {
                                          return Column(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              5.heightBox,
                                              CustomText(
                                                text: controller
                                                    .payload[index].name
                                                    .toString(),
                                                fontSize: 14.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              5.heightBox,
                                              const Divider(),
                                            ],
                                          ).box.make().onTap(() {
                                            controller.selectedPractice.value =
                                                controller.payload[index].name!;
                                            controller
                                                    .selectedPractice_Id.value =
                                                controller.payload[index].id!;
                                            controller.fetchDoctors(controller
                                                .selectedPractice_Id.value);
                                            Get.back();
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        );
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: controller.selectedPractice.value,
                        hintStyle: const TextStyle(color: textfieldgrey),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: textfieldgrey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        suffixIcon: Transform.scale(
                          scale: 0.3, // Scaling factor
                          child: Image.asset(
                            "assets/icons/dropdown.png",
                            width: 10,
                            height: 10,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10, top: 0),
                      ),
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      const BottomSheetContent(),
                      isScrollControlled: true,
                    );
                  },
                  child: Container(
                    width: 50.w,
                    height: 43.h,
                    decoration: const BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: whitecolor,
                    ),
                  ),
                ),
              ],
            ),
            10.heightBox,
            Obx(() {
              return TextFormField(
                style: const TextStyle(color: textfieldgrey),
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                    title: "Select Doctor",
                    titlePadding: defaultpad,
                    contentPadding: defaultpad,
                    titleStyle: GoogleFonts.roboto(
                      color: blackcolor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    content: Obx(
                      () => controller.doctors.isNotEmpty
                          ? Padding(
                              padding: defaultpad,
                              child: Column(
                                children: List.generate(
                                  controller.doctors.length,
                                  (index) {
                                    return Column(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        5.heightBox,
                                        CustomText(
                                          text: controller.doctors[index].name
                                              .toString(),
                                          fontSize: 14.sp,
                                          color: textfieldgrey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        5.heightBox,
                                        const Divider(),
                                      ],
                                    ).box.make().onTap(() {
                                      controller.selectedDoctor.value =
                                          controller.doctors[index].name!;
                                      controller.selectedDoctorId.value =
                                          controller.doctors[index].id!;
                                      Get.back();
                                    });
                                  },
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  );
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: controller.selectedDoctor.value.isNotEmpty
                      ? controller.selectedDoctor.value
                      : "Select Doctor",
                  hintStyle: const TextStyle(color: textfieldgrey),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: textfieldgrey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  suffixIcon: Transform.scale(
                    scale: 0.3, // Scaling factor
                    child: Image.asset(
                      "assets/icons/dropdown.png",
                      width: 10,
                      height: 10,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 10, top: 0),
                ),
              );
            }),
            10.heightBox,
            CustomTextFieldForPatient(
              textInputType: TextInputType.number,
              hintText: "Phone",
              controller: controller.telephoneNumberController.value,
              validator: Validators.validation("Phone"),
            ),
            10.heightBox,
            Obx(
              () => TextFormField(
                readOnly: true,
                onTap: () {
                  controller.selectDate(
                      context, controller.dateController.value);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Date cannot be empty.";
                  }
                  return null;
                },
                style: const TextStyle(color: textfieldgrey),
                controller: controller.dateController.value,
                decoration: InputDecoration(
                  hintText: controller.dateController.value.text.isNotEmpty
                      ? controller.formattedDate
                      : "Date",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
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
            10.heightBox,
            customFieldDropDown(
              hintttext: controller.selectedPermissions,
              valuesList: controller.permissions,
            ),
            10.heightBox,
            CustomTextFieldForPatient(
              textInputType: TextInputType.visiblePassword,
              hintText: "Password",
              controller: controller.passwordController.value,
              validator: Validators.validation("Password"),
            ),
            20.heightBox,
            CustomButton(
              text: isedit == true ? "Update Staff" : "Add Staff",
              onPressed: () {
                isedit != true
                    ? controller.createStaff()
                    : controller.updateStaffmember();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateStaffController());
    return Container(
      decoration: const BoxDecoration(
        color: whitecolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: pad20,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Add New Practice',
                    fontSize: 20.sp,
                    color: blackcolor,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      color: textfieldgrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomTextFieldForPatient(
                textInputType: TextInputType.name,
                hintText: "Practice Name",
                controller: controller.practiceNameController.value,
                validator: Validators.validation("Practice Name"),
              ),
              10.heightBox,
              CustomTextFieldForPatient(
                textInputType: TextInputType.phone,
                hintText: "eg. 568884",
                controller: controller.practiceZipCodeController.value,
                validator: Validators.validation("Zip code"),
              ),
              10.heightBox,
              TextFormField(
                keyboardType: TextInputType.text,
                style: const TextStyle(color: blackcolor),
                controller: controller.addressController.value,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Message...",
                  fillColor: whitecolor,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  contentPadding: const EdgeInsets.only(
                    top: 5,
                    bottom: 0,
                    left: 10.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: greyColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: textfieldgrey),
                  ),
                ),
              ),
              10.heightBox,
              Obx(
                () => controller.isloading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        text: "Add",
                        onPressed: () {
                          controller.createNewPractice().then((val) {
                            Get.back();
                          });
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
