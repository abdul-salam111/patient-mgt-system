import 'package:get/get.dart';

import 'package:patient_management/app/data/getModels/doctor/getAllDoctorsModel.dart';
import 'package:patient_management/app/repositories/admin/adminRepository.dart';
import 'package:patient_management/app/repositories/doctor/doctorRespository.dart';

class AllDoctorsController extends GetxController {
  var isSwitchedList = <RxBool>[].obs;
  var getAllDoctorsModel = GetAllDoctorsModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  AdminRepository adminRepository = AdminRepository();
  DoctorRepsitory doctorRepsitory = DoctorRepsitory();

  void toggleSwitch(int index, bool value) {
    isSwitchedList[index].value = value;
  }

  RxList<Payload> tempPayload = <Payload>[].obs;

  void initializeSwitches(List<Payload> doctors) {
    isSwitchedList.value =
        doctors.map((doctor) => (doctor.fillOutForm == 1).obs).toList();
  }

  Future fetchDoctors() async {
    try {
      isLoading(true);
      getAllDoctorsModel.value = await doctorRepsitory.fetchDoctors();
      initializeSwitches(getAllDoctorsModel.value.payload ?? []);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  Future updateStatusForDoctor(id, filloutform) async {
    try {
      isLoading(true);
      getAllDoctorsModel.value =
          await doctorRepsitory.updateFormStatus(id, filloutform);
      initializeSwitches(getAllDoctorsModel.value.payload ?? []);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
