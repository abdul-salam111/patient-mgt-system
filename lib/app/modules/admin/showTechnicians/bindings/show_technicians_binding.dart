import 'package:get/get.dart';

import '../controllers/show_technicians_controller.dart';

class ShowTechniciansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowTechniciansController>(
      () => ShowTechniciansController(),
    );
  }
}
