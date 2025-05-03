import 'package:get/get.dart';

import '../controllers/all_patients_controller.dart';

class AllPatientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPatientsController>(
      () => AllPatientsController(),
    );
  }
}
