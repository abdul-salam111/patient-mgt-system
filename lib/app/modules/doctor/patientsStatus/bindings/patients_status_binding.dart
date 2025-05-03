import 'package:get/get.dart';

import '../controllers/patients_status_controller.dart';

class PatientsStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientsStatusController>(
      () => PatientsStatusController(),
    );
  }
}
