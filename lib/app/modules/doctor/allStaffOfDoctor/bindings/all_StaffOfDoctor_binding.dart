import 'package:get/get.dart';

import '../controllers/all_StaffOfDoctor_controller.dart';

class AllPatientsByDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllStaffOfDoctorController>(
      () => AllStaffOfDoctorController(),
    );
  }
}
