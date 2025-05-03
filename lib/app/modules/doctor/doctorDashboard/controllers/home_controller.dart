import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart';
import 'package:patient_management/app/repositories/patient/patientRepository.dart';

class HomeController extends GetxController {
  var getAllPateintModel = GetAllPatient().obs;
  var isloading = false.obs;

  PatientRepository patientRepsitory = PatientRepository();
  Future fetchAllPateints() async {
    try {
      isloading.value = true;
      getAllPateintModel.value = await patientRepsitory.fetchPateints();

      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPateints();
  }

  RxList<Payload> tempList = <Payload>[].obs;
}
