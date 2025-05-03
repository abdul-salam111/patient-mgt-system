import 'package:get/get.dart';

import '../controllers/show_practices_controller.dart';

class ShowPracticesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPracticesController>(
      () => ShowPracticesController(),
    );
  }
}
