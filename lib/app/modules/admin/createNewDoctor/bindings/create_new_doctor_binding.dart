import 'package:get/get.dart';

import '../controllers/create_new_doctor_controller.dart';

class CreateNewDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewDoctorController>(
      () => CreateNewDoctorController(),
    );
  }
}
