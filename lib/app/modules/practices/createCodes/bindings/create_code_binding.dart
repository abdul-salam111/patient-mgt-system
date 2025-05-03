import 'package:get/get.dart';

import '../controllers/create_code_controller.dart';

class CreateCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCodeController>(
      () => CreateCodeController(),
    );
  }
}
