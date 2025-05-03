import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customButton.dart';
import 'package:patient_management/app/commonWidgets/customTextfields.dart';
import 'package:patient_management/app/commonWidgets/validators.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/create_code_controller.dart';

class CreateCodeView extends GetView<CreateCodeController> {
  const CreateCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Code'),
          centerTitle: true,
        ),
        body: Padding(
          padding: pad16,
          child: Column(
            children: [
              CustomTextFieldForPatient(
                  textInputType: TextInputType.text,
                  hintText: "Code Name",
                  controller: controller.codeNameController.value,
                  validator: Validators.validation("Code Name")),
              10.heightBox,
              CustomTextFieldForPatient(
                  textInputType: TextInputType.text,
                  hintText: "Description",
                  controller: controller.codeDescriptionController.value,
                  validator: Validators.validation("Description")),
              30.heightBox,
              Obx(
                () => controller.isLoading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        text: "Add",
                        onPressed: () {
                          controller.createNewCode();
                        }),
              )
            ],
          ),
        ));
  }
}
