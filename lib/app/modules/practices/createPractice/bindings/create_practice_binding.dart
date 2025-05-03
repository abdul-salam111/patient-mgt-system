import 'package:get/get.dart';

import '../controllers/create_practice_controller.dart';

class CreatePracticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePracticeController>(
      () => CreatePracticeController(),
    );
  }
}
