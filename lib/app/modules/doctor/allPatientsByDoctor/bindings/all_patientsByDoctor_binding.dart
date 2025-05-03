import 'package:get/get.dart';

import '../controllers/all_patientsByDoctor_controller.dart';

class AllPatientsByDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPatientsByDoctorController>(
      () => AllPatientsByDoctorController(),
    );
  }
}
