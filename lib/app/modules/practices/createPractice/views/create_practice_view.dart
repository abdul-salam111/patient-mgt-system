import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/create_practice_controller.dart';

class CreatePracticeView extends GetView<CreatePracticeController> {
  const CreatePracticeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Practice'),
          centerTitle: true,
        ),
        body: Padding(
          padding: pad16,
          child: Column(
            children: [
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
                style: const TextStyle(color: textfieldgrey),
                controller: controller.addressController.value,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Address...",
                  fillColor: whitecolor,
                  filled: true,
                  hintStyle: const TextStyle(color: textfieldgrey),
                  contentPadding: const EdgeInsets.only(
                    top: 20,
                    bottom: 0,
                    left: 10.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
                    borderSide: const BorderSide(
                        color: greyColor), // Adjust border color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
                    borderSide: const BorderSide(
                        color: greyColor), // Adjust border color as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the radius as needed
                    borderSide: const BorderSide(
                        color: textfieldgrey), // Adjust border color as needed
                  ),
                ),
              ),
              30.heightBox,
              Obx(
                () => controller.isLoading.value == true
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
              )
            ],
          ),
        ));
  }
}
