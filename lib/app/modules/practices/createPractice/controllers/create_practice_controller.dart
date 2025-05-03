import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/data/postModels/admin/createPracticeModel.dart';
import 'package:patient_management/app/repositories/practices/practicesRepository.dart';

class CreatePracticeController extends GetxController {
  final practiceNameController = TextEditingController().obs;
  final practiceZipCodeController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  var isLoading = false.obs;
  PracticesRepository practicesRepository = PracticesRepository();
  GetAllPractices getAllPractices = GetAllPractices();

  //create new practice
  Future createNewPractice() async {
    try {
      isLoading.value = true;
      getAllPractices = await practicesRepository.createPractice(
          CreatePracticeModel(
              name: practiceNameController.value.text.toString(),
              zipcode: practiceZipCodeController.value.text.toString(),
              address: addressController.value.text.toString()));
      practiceNameController.value.clear();
      practiceZipCodeController.value.clear();
      addressController.value.clear();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
