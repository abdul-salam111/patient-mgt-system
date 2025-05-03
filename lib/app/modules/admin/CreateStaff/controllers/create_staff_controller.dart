import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/data/getModels/staff/getAllStaffModel.dart'
    as staff;

import 'package:patient_management/app/data/postModels/admin/createPracticeModel.dart';
import 'package:patient_management/app/data/postModels/staff/createStaffModel.dart';
import 'package:patient_management/app/repositories/practices/practicesRepository.dart';
import 'package:patient_management/app/repositories/staff/staffRepository.dart';

class CreateStaffController extends GetxController {
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
  var selectedPracticeId = 0.obs;
  GetAllPractices getAllPractices = GetAllPractices();
  var selectedPractice_Id = 0.obs;
  staff.Payload? getStaffModel;
  List<Payload> payload = [];
  var selectedPractice = "Practice".obs;
  var doctors = <Doctor>[].obs;
  var selectedDoctor = ''.obs;
  var selectedDoctorId = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPractices();
    if (Get.arguments[1] == true) {
      getStaffModel = Get.arguments[0];
      selectedPractice_Id.value = getStaffModel!.practiceId!;
      staffNameController.value.text = getStaffModel!.name!;
      userNameController.value.text = getStaffModel!.userName!;
      emailAddressController.value.text = getStaffModel!.email!;
      telephoneNumberController.value.text = getStaffModel!.phone!;
      faxController.value.text = getStaffModel!.fax!;
      passwordController.value.text = getStaffModel!.originalPassword!;
      dateController.value.text = getStaffModel!.date.toString().split(' ')[0];
      // practiceNameController.value.text = getStaffModel!.practice!.name!;
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

  void fetchDoctors(int practiceId) {
    var practice = payload.firstWhere((p) => p.id == practiceId,
        orElse: () => Payload(doctor: []));
    print(practiceId);
    print(practice);
    if (practice.doctor != null) {
      doctors.value = practice.doctor!;
    } else {
      doctors.value = [];
    }
  }

  // void fetchDoctors(int practiceId) async {
  //   doctors.value =
  //       payload.firstWhere((Doctor) => Doctor.name == practiceId).doctor!;
  // }

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

  var selectedPermissions = "Fill Out Form".obs;
  List<String> permissions = ['Allowed', 'Not Allowed'];
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

  StaffRepository staffRepository = StaffRepository();

  Future createStaff() async {
    await staffRepository.createAStaffMember(CreateStaffModel(
      name: staffNameController.value.text,
      userName: userNameController.value.text,
      fax: faxController.value.text,
      phone: telephoneNumberController.value.text,
      practiceId: selectedPractice_Id.value.toString(),
      doctor_id: selectedDoctorId.value,
      fillOutForm: selectedPermissions.value == "Allowed" ? '1' : '0',
      date: dateController.value.text,
      password: passwordController.value.text,
      email: emailAddressController.value.text,
    ));
    staffNameController.value.clear();
    userNameController.value.clear();
    faxController.value.clear();
    telephoneNumberController.value.clear();
    dateController.value.clear();
    passwordController.value.clear();
    emailAddressController.value.clear();
  }

  //update technician
  Future updateStaffmember() async {
    staffRepository.updateStaff(
      id: getStaffModel!.id!,
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
}
