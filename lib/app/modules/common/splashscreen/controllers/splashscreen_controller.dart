import 'package:get/get.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2), () {
      if (sharedPrefbox.read(userToken) != null) {
        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        Get.toNamed(Routes.SIGNIN);
      }
    });
  }
}
