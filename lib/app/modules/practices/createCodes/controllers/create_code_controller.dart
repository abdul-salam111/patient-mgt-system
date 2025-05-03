import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/data/postModels/admin/createCodeModel.dart';
import 'package:patient_management/app/repositories/code/codeRepository.dart';

class CreateCodeController extends GetxController {
  final codeNameController = TextEditingController().obs;
  final codeDescriptionController = TextEditingController().obs;

  var isLoading = false.obs;
  CodeRepository codeRepository = CodeRepository();
  GetAllPractices getAllPractices = GetAllPractices();

  //create new practice
  Future createNewCode() async {
    try {
      isLoading.value = true;
      await codeRepository.createCode(CreateCodeModel(
        code: codeNameController.value.text.toString(),
        description: codeDescriptionController.value.text.toString(),
      ));
      codeNameController.value.clear();
      codeDescriptionController.value.clear();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
