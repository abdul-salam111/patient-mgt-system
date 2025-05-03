import 'package:get/get.dart';

import '../controllers/allpatientsview_for_staff_controller.dart';

class AllpatientsviewForStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllpatientsviewForStaffController>(
      () => AllpatientsviewForStaffController(),
    );
  }
}
