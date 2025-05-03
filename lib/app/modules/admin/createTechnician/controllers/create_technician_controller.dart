import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart'
    as practice;
import 'package:patient_management/app/data/getModels/technician/getTechnicianModel.dart'
    as tech;
import 'package:patient_management/app/data/postModels/admin/createPracticeModel.dart';
import 'package:patient_management/app/data/postModels/technician/createTechnicianModel.dart';
import 'package:patient_management/app/repositories/practices/practicesRepository.dart';
import 'package:patient_management/app/repositories/technician/technician.dart';

class CreateTechnicianController extends GetxController {
  final staffNameController = TextEditingController().obs;
  final userNameController = TextEditingController().obs;
  final emailAddressController = TextEditingController().obs;
  final telephoneNumberController = TextEditingController().obs;
  final faxController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final practiceNameController = TextEditingController().obs;
  final practiceZipCodeController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  var isloading = false.obs;

  practice.GetAllPractices getAllPractices = practice.GetAllPractices();
  tech.Payload? getTechnicianModel;
  var selectedPractice_Id = 0.obs;
  List<practice.Payload> payload = [];
  var selectedPractice = "Practice".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPractices();
    if (Get.arguments[1] == true) {
      getTechnicianModel = Get.arguments[0];
// selectedPractice_Id.value=getTechnicianModel!.practiceId!;
      staffNameController.value.text = getTechnicianModel!.name!;
      userNameController.value.text = getTechnicianModel!.userName!;
      emailAddressController.value.text = getTechnicianModel!.email!;
      telephoneNumberController.value.text = getTechnicianModel!.phone!;
      faxController.value.text = getTechnicianModel!.fax!;
      passwordController.value.text = getTechnicianModel!.originalPassword!;
      dateController.value.text =
          getTechnicianModel!.date.toString().split(' ')[0];
      // practiceNameController.value.text = getTechnicianModel!.practice!.name!;
    }
  }

  PracticesRepository practicesRepository = PracticesRepository();
  //fetch all practices
  Future fetchAllPractices() async {
    try {
      isloading.value = true;
      getAllPractices = await practicesRepository.getAllPractices();
      payload.addAll(getAllPractices.payload!);

      isloading.value = false;
    } catch (e) {
      isloading.value = false;

      throw Exception(e);
    }
  }

  //create new practice
  Future createNewPractice() async {
    try {
      isloading.value = true;
      getAllPractices = await practicesRepository.createPractice(
          CreatePracticeModel(
              name: practiceNameController.value.text.toString(),
              zipcode: practiceZipCodeController.value.text.toString(),
              address: addressController.value.text.toString()));
      practiceNameController.value.clear();
      practiceZipCodeController.value.clear();
      addressController.value.clear();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;

      throw Exception(e);
    }
  }

  var selectedDate = DateTime.now().obs;
  String get formattedDate {
    return DateFormat('yyyy/MM/dd').format(selectedDate.value);
  }

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

  TechnicianRepository technicianRepository = TechnicianRepository();

  Future createNewTechnician() async {
    await technicianRepository.createTechnician(CreateTechnicianModel(
        name: staffNameController.value.text,
        userName: userNameController.value.text,
        // practiceId: selectedPractice_Id.value.toString(),
        phone: telephoneNumberController.value.text,
        fax: faxController.value.text,
        password: passwordController.value.text,
        email: emailAddressController.value.text,
        date: dateController.value.text,
        roles: selectedItems));
    staffNameController.value.clear();
    userNameController.value.clear();
    faxController.value.clear();
    telephoneNumberController.value.clear();
    dateController.value.clear();
    passwordController.value.clear();
    emailAddressController.value.clear();
  }

  //update technician
  Future updateTechnician() async {
    technicianRepository.updateTechnician(
      id: getTechnicianModel!.id!,
      password: passwordController.value.text.toString(),
      name: staffNameController.value.text.toString(),
      username: userNameController.value.text.toString(),
      practiceId: selectedPractice_Id.value.toString(),
      emails: emailAddressController.value.text.toString(),
      phone: telephoneNumberController.value.text.toString(),
      fax: faxController.value.text.toString(),
      date: dateController.value.text.toString(),
    );
  }

  var selectedItems = <String>[].obs; // List of selected items

  // Function to handle checkbox toggle
  void toggleItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  // Check if an item is selected
  bool isSelected(String item) {
    return selectedItems.contains(item);
  }
}
