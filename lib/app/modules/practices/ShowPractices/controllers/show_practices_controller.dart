import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/admin/getAllPractices.dart';
import 'package:patient_management/app/repositories/practices/practicesRepository.dart';

class ShowPracticesController extends GetxController {
  PracticesRepository practicesRepository = PracticesRepository();

  var getAllPractices = GetAllPractices().obs;
  var isLoading = false.obs;

  Future getalllPractices() async {
    try {
      isLoading.value = true;
      getAllPractices.value = await practicesRepository.getAllPractices();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getalllPractices();
  }
}
