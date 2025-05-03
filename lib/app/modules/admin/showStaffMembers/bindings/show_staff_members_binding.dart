import 'package:get/get.dart';

import '../controllers/show_staff_members_controller.dart';

class ShowStaffMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ShowStaffMembersController>(
     ShowStaffMembersController(),
    );
  }
}
