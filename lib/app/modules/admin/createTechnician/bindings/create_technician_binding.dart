import 'package:get/get.dart';

import '../controllers/create_technician_controller.dart';

class CreateTechnicianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTechnicianController>(
      () => CreateTechnicianController(),
    );
  }
}
