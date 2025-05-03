import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:patient_management/app/data/getModels/doctor/getAllDoctorsModel.dart';
import 'package:patient_management/app/modules/admin/Dashboard/controllers/dashboard_controller.dart';
import 'package:patient_management/app/repositories/admin/adminRepository.dart';

class CreatePatientByAdminController extends GetxController {
  final dashboardcontroller = Get.put(DashboardController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllDoctorsModel.value = dashboardcontroller.getAllDoctorsModel.value;
  }

  var selectedDoctorName = "Select Doctor".obs;
  var selectedDoctorId = "".obs;

  var selectedTitle = 'Mr.'.obs;
  var selectedStatus = 'status'.obs;
  var selectedICD = 'E66.9'.obs;
  var selectedSex = "Male".obs;
  var selectedJournal = "Patient Journal".obs;

  var selectedHrs = "Hrs".obs;
  RxList<String> selectedValues = <String>[].obs;
  RxList<String> selectedICDs = <String>[].obs;

  List<String> title = ['Mr', 'Ms'];
  List<String> packets = ['Yes', 'No'];
  var getAllDoctorsModel = GetAllDoctorsModel().obs;

  var isloading = false.obs;

  List<String> hrs = ['72', '96', '120'];
  List<String> journal = ['Yes', 'No'];
  List<String> medicaid = ['Yes', 'No'];
  var selectedMedicaid = "medicaid".obs;
  List<String> status = ['Pending', 'Completed'];
  List<String> iCDS = [
    'E66.9',
    'E88.81',
    'F49.9',
    'F44',
    'G20',
    'G25.3',
    'G30.9',
    'G31.84',
    'G40.009',
    'G40.019',
    'G40.109',
    "G40.219",
    "G40.309",
    "G40.319",
    "G40.409",
    "G40.419",
    "G40.802",
    "G40.804",
    "G40.809",
    "G40.89",
    "G40.901",
    "G40.909",
    "G40.919",
    "G40.A09",
    "G43.909",
    "G44.309",
    "G45.9",
    "G47.33",
    "G60.9",
    "G80.9",
    "G93.40",
    "I10",
    "I63.9",
    "R20.2",
    "R25.1",
    "R25.3",
    "R29.898",
    "R40.019",
    "R40.1",
    "R40.4",
    "R41.3",
    "R41.82",
    "R41.89",
    "R41.9",
    "R42",
    "R51.9",
    "R53.1",
    "R55",
    "R56.1",
    "R56.9",
    "R68.89",
    "R94.01",
    "S06.0X9A",
    "S09.90XS",
    "UNK",
    "Z13.89",
    "Z72.0",
    "Z86.73",
    "Z87.898"
  ];

  List<String> gender = ['Male', 'Female'];

  final formkey = GlobalKey<FormState>();

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final midinitalNameController = TextEditingController().obs;
  final dateOfBirthController = TextEditingController().obs;
  final dateRecievedController = TextEditingController().obs;
  final requestingPhysicianController = TextEditingController().obs;
  final primaryInsuranceController = TextEditingController().obs;
  final secondaryInsuranceController = TextEditingController().obs;
  final dateHookupController = TextEditingController().obs;
  final dateDisconnectController = TextEditingController().obs;
  final medicaidController = TextEditingController().obs;
  final hrsController = TextEditingController().obs;
  final continuesIntermitttentController = TextEditingController().obs;
  final rescheduledReasonController = TextEditingController().obs;
  final medicationsController = TextEditingController().obs;
  final locationController = TextEditingController().obs;
  final contactNumberController = TextEditingController().obs;
  final setuptechnicianController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final disconnectTechnicianController = TextEditingController().obs;
  final preAuthRefController = TextEditingController().obs;
  final sbillSubmittedController = TextEditingController().obs;
  final professionalComponentController = TextEditingController().obs;
  final professionalComponentPracticeController = TextEditingController().obs;
  final pruningTechnicianController = TextEditingController().obs;
  final datePruningCompletedController = TextEditingController().obs;
  final rescheduledDateSetupController = TextEditingController().obs;
  final rescheduledDateDisconnectController = TextEditingController().obs;
  final datePaymentReceivedController = TextEditingController().obs;
  final patientJournalController = TextEditingController().obs;

  final prunerNotificationSentController = TextEditingController().obs;
  final datePrunerPaidController = TextEditingController().obs;

  final streetAddressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final zipController = TextEditingController().obs;
  final morningsShiftController = TextEditingController().obs;
  final invoiceController = TextEditingController().obs;
  final amountReceivedController = TextEditingController().obs;
  final miController = TextEditingController().obs;

  var selectedDate = DateTime.now().obs;
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  final selectDateController = TextEditingController().obs;

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

  String get formattedDate {
    return DateFormat('yyyy-MM-dd').format(selectedDate.value);
  }

  AdminRepository adminRepository = AdminRepository();
  Future createNewPatient() async {
    try {
      await adminRepository.createPatient(
        firstName: firstNameController.value.text,
        lastName: lastNameController.value.text,
        mi: miController.value.text,
        dob: dateOfBirthController.value.text,
        requestingPhysician: requestingPhysicianController.value.text,
        practiceId: '1',
        docid: selectedDoctorId.value,
        primaryInsurance: primaryInsuranceController.value.text,
        secondaryInsurance: secondaryInsuranceController.value.text,
        medicaid: selectedMedicaid.value == "Yes" ? '1' : '0',
        hrs: selectedHrs.value,
        continuousIntermittent: continuesIntermitttentController.value.text,
        sex: selectedSex.value,
        rescheduledReason: rescheduledDateDisconnectController.value.text,
        medications: medicationsController.value.text,
        datePruningCompleted: datePruningCompletedController.value.text,
        rescheduledDateDisconnect:
            rescheduledDateDisconnectController.value.text,
        rescheduledDateSetup: rescheduledDateDisconnectController.value.text,
        contactNumber: contactNumberController.value.text,
        setupTechnician: setuptechnicianController.value.text,
        disconnectTechnician: disconnectTechnicianController.value.text,
        preAuthRefNbr: preAuthRefController.value.text,
        sbillSubmitted: sbillSubmittedController.value.text,
        professionalComponent: professionalComponentController.value.text,
        professionalComponentPractice:
            professionalComponentPracticeController.value.text,
        pruningTechnician: pruningTechnicianController.value.text,
        patientJournal: selectedJournal.value == "Yes" ? '1' : '0',
        streetAddress: streetAddressController.value.text,
        city: cityController.value.text,
        state: stateController.value.text,
        zip: zipController.value.text,
        monitoringShift: morningsShiftController.value.text,
        invoice: invoiceController.value.text,
        amountReceived: amountReceivedController.value.text,
        icdCodeId: selectedICDs,
        status: selectedStatus.value,
        dateHookup: dateHookupController.value.text,
        datePaymentReceived: datePaymentReceivedController.value.text,
        datePrunerPaid: datePrunerPaidController.value.text,
        dateRecieved: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        datedisconnect: dateDisconnectController.value.text,
        prunerNotificationSent: prunerNotificationSentController.value.text,
      );
      // firstNameController.value.clear();
      // lastNameController.value.clear();
      // miController.value.clear();
      // medicaidController.value.clear();
      // contactNumberController.value.clear();
      // continuesIntermitttentController.value.clear();
      // ageController.value.clear();
      // hrsController.value.clear();
      // zipController.value.clear();
      // invoiceController.value.clear();
      // amountReceivedController.value.clear();
      // cityController.value.clear();
      // stateController.value.clear();
      // setuptechnicianController.value.clear();
      // disconnectTechnicianController.value.clear();
      // dateOfBirthController.value.clear();
      // dateHookupController.value.clear();
      // prunerNotificationSentController.value.clear();
      // morningsShiftController.value.clear();
      // primaryInsuranceController.value.clear();
      // secondaryInsuranceController.value.clear();
      // sbillSubmittedController.value.clear();
      // professionalComponentController.value.clear();
      // professionalComponentPracticeController.value.clear();

      // rescheduledDateDisconnectController.value.clear();
      //rescheduledDateSetupController.value.clear();
    } catch (e) {
      throw Exception(e);
    }
  }
}
