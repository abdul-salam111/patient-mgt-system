import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/create_technician_controller.dart';

class CreateTechnicianView extends GetView<CreateTechnicianController> {
  const CreateTechnicianView({super.key});
  @override
  Widget build(BuildContext context) {
    var isEdit = Get.arguments[1];
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
              text: 'Add New Technician',
              fontSize: 20.sp,
              color: blackcolor,
              fontWeight: FontWeight.w600),
          centerTitle: true,
        ),
        body: Padding(
          padding: pad16,
          child: ListView(
            children: [
              const SizedBox(height: 16),
              CustomTextFieldForPatient(
                  textInputType: TextInputType.name,
                  hintText: "Technician Name",
                  controller: controller.staffNameController.value,
                  validator: Validators.validation("Name")),
              10.heightBox,
              CustomTextFieldForPatient(
                  textInputType: TextInputType.name,
                  hintText: "Username",
                  controller: controller.userNameController.value,
                  validator: Validators.validation("userName")),
              10.heightBox,
              CustomTextFieldForPatient(
                  textInputType: TextInputType.name,
                  hintText: "Email",
                  controller: controller.emailAddressController.value,
                  validator: Validators.validation("Email")),
              10.heightBox,
              CustomTextFieldForPatient(
                  textInputType: TextInputType.name,
                  hintText: "Fax",
                  controller: controller.faxController.value,
                  validator: Validators.validation("Fax")),
              10.heightBox,
              CustomTextFieldForPatient(
                  textInputType: TextInputType.number,
                  hintText: "Phone",
                  controller: controller.telephoneNumberController.value,
                  validator: Validators.validation("Phone")),
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
                  style: TextStyle(color: textfieldgrey, fontSize: 14.sp),
                  controller: controller.dateController.value,
                  decoration: InputDecoration(
                    hintText: controller.dateController.value.text.isNotEmpty
                        ? controller.formattedDate
                        : "Date",
                    hintStyle: TextStyle(color: textfieldgrey, fontSize: 15.sp),
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
              10.heightBox,
              CustomTextFieldForPatient(
                  textInputType: TextInputType.visiblePassword,
                  hintText: "Password",
                  controller: controller.passwordController.value,
                  validator: Validators.validation("Password")),
              10.heightBox,
              const Text(
                "Role",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Obx(() => Wrap(
                    spacing: 8.0, // Spacing between checkboxes horizontally
                    children: [
                      // Checkbox 1
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: controller.isSelected('setup technician'),
                            onChanged: (bool? value) {
                              controller.toggleItem('setup technician');
                            },
                          ),
                          const Text(
                            'Setup Technician',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      // Checkbox 2
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value:
                                controller.isSelected('disconnect technician'),
                            onChanged: (bool? value) {
                              controller.toggleItem('disconnect technician');
                            },
                          ),
                          const Text(
                            'Disconnect Technician',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      // Checkbox 3
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: controller.isSelected('pruning technician'),
                            onChanged: (bool? value) {
                              controller.toggleItem('pruning technician');
                            },
                          ),
                          const Text(
                            'Pruning Technician',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  )),
              20.heightBox,
              CustomButton(
                  text: isEdit == true ? "Update Technician" : "Add Technician",
                  onPressed: () {
                    isEdit == true
                        ? controller.updateTechnician()
                        : controller.createNewTechnician();
                  })
            ],
          ),
        ));
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateTechnicianController());
    return Padding(
      padding: pad20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText(
                  text: 'Add New Practice',
                  fontSize: 20.sp,
                  color: blackcolor,
                  fontWeight: FontWeight.w600),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: textfieldgrey,
                  )),
            ],
          ),
          SizedBox(height: 16.h),
          CustomTextFieldForPatient(
              textInputType: TextInputType.name,
              hintText: "Practice Name",
              controller: controller.practiceNameController.value,
              validator: Validators.validation("Practice Name")),
          10.heightBox,
          CustomTextFieldForPatient(
              textInputType: TextInputType.phone,
              hintText: "eg. 568884",
              controller: controller.practiceZipCodeController.value,
              validator: Validators.validation("Zip code")),
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
                    }),
          ),
        ],
      ),
    );
  }
}
