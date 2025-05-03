import 'package:get/get.dart';

import '../controllers/showtechnician_profile_controller.dart';

class ShowtechnicianProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowtechnicianProfileController>(
      () => ShowtechnicianProfileController(),
    );
  }
}
