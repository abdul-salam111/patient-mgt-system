import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/staff/getAllStaffModel.dart';
import 'package:patient_management/app/repositories/staff/staffRepository.dart';
import 'package:patient_management/app/resources/storageServices.dart';

class ShowStaffMembersController extends GetxController {
  var staffList = GetAllStaffMembers().obs;

  StaffRepository staffRepository = StaffRepository();
  Future<GetAllStaffMembers> getallstaffMembers() async {
    print(sharedPrefbox.read(userToken));
    staffList.value = await staffRepository.fetchStaff();
    return staffRepository.fetchStaff();
  }

  Future deleteStaffMember(int id) async {
    await staffRepository.deleteStaffMember(id);
    // await staffRepository.fetchStaff();
  }

  RxList<Payload> tempPayload = <Payload>[].obs;
}
