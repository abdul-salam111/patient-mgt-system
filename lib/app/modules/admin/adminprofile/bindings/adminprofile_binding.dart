import 'package:get/get.dart';

import '../controllers/adminprofile_controller.dart';

class AdminprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminprofileController>(
      () => AdminprofileController(),
    );
  }
}
