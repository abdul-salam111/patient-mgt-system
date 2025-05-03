import 'package:get/get.dart';

import '../controllers/patientfiles_controller.dart';

class PatientfilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientfilesController>(
      () => PatientfilesController(),
    );
  }
}
