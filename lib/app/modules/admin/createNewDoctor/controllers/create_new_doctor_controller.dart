import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_management/app/data/postModels/admin/createPracticeModel.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/data/postModels/doctor/createDoctorModel.dart';
import 'package:patient_management/app/repositories/doctor/doctorRespository.dart';
import 'package:patient_management/app/repositories/practices/practicesRepository.dart';

class CreateNewDoctorController extends GetxController {
  var selectedPermissions = "Fill Out Form".obs;
  List<String> permissions = ['Allowed', 'Not Allowed'];

  List<Payload> payload = [];
  var selectedPractice = "Practice".obs;

  final doctorNameController = TextEditingController().obs;
  final userNameController = TextEditingController().obs;
  final emailAddressController = TextEditingController().obs;
  final telephoneNumberController = TextEditingController().obs;
  final faxController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final practiceNameController = TextEditingController().obs;
  final practiceZipCodeController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  var selectedPractice_Id = 0.obs;
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

  PracticesRepository practicesRepository = PracticesRepository();
  GetAllPractices getAllPractices = GetAllPractices();
  var isloading = false.obs;

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

  //create new practice
  DoctorRepsitory doctorRepsitory = DoctorRepsitory();

  Future createNewDoctor() async {
    try {
      getAllPractices = await doctorRepsitory.createNewDoctor(CreateNewDoctor(
          name: doctorNameController.value.text,
          email: emailAddressController.value.text,
          fax: faxController.value.text,
          phone: telephoneNumberController.value.text,
          password: passwordController.value.text,
          date: dateController.value.text,
          userName: userNameController.value.text,
          practiceId: selectedPractice_Id.value,
          fill_out_form: selectedPermissions.value == "Allowed" ? 1 : 0));
      doctorNameController.value.clear();
      emailAddressController.value.clear();
      faxController.value.clear();
      telephoneNumberController.value.clear();
      passwordController.value.clear();
      dateController.value.clear();
      userNameController.value.clear();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPractices();
  }
}
