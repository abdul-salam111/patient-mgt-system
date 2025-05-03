import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/technician/getTechnicianModel.dart';
import 'package:patient_management/app/repositories/technician/technician.dart';

class ShowTechniciansController extends GetxController {
  TechnicianRepository technicianRepository = TechnicianRepository();
  var getTechnicianModel = GetTechnicianModel().obs;
  Future<GetTechnicianModel> showTechnicians() async {
    getTechnicianModel.value = await technicianRepository.fetchTechnicians();
    return technicianRepository.fetchTechnicians();
  }

  Future deleteTechnician(int id) async {
    await technicianRepository.deleteTechnician(id);
    await technicianRepository.fetchTechnicians();
  }

  RxList<Payload> tempPayload = <Payload>[].obs;
}
