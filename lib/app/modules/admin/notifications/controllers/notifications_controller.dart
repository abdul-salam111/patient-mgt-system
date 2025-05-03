import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/notifications/getNotifications.dart';
import 'package:patient_management/app/repositories/admin/adminRepository.dart';

class NotificationsController extends GetxController {
  AdminRepository adminRepository = AdminRepository();
  Future<GetNotificationsModel> getAllNotifications() async {
    return adminRepository.getAllNotifications();
  }
}
