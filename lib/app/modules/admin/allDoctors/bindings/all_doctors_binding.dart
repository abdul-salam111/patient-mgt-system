import 'package:get/get.dart';

import '../controllers/all_doctors_controller.dart';

class AllDoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AllDoctorsController>(
       AllDoctorsController(),
    );
  }
}
