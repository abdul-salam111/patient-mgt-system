import 'package:get/get.dart';

import '../controllers/create_staff_controller.dart';

class CreateStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateStaffController>(
      () => CreateStaffController(),
    );
  }
}
