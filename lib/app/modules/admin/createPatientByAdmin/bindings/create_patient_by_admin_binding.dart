import 'package:get/get.dart';

import '../controllers/create_patient_by_admin_controller.dart';

class CreatePatientByAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePatientByAdminController>(
      () => CreatePatientByAdminController(),
    );
  }
}
