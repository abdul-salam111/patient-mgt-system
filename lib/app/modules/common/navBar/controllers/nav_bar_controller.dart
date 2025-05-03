import 'package:get/get.dart';
import 'package:patient_management/app/modules/admin/Dashboard/views/dashboard_view.dart';
import 'package:patient_management/app/modules/admin/allDoctors/views/all_doctors_view.dart';
import 'package:patient_management/app/modules/admin/allPatients/views/all_patients_view.dart';
import 'package:patient_management/app/modules/admin/showStaffMembers/views/show_staff_members_view.dart';
import 'package:patient_management/app/modules/admin/showTechnicians/views/show_technicians_view.dart';
import 'package:patient_management/app/modules/common/chats/views/chats_view.dart';
import 'package:patient_management/app/modules/doctor/allPatientsByDoctor/views/all_patientsByDoctor_view.dart';
import 'package:patient_management/app/modules/doctor/allStaffOfDoctor/views/all_StaffOfDoctor_view.dart';
import 'package:patient_management/app/modules/doctor/doctorDashboard/views/home_view.dart';
import 'package:patient_management/app/modules/staff/allpatientsviewForStaff/views/allpatientsview_for_staff_view.dart';
import 'package:patient_management/app/modules/technician/technicianDashboard/views/technician_dashboard_view.dart';

class NavBarController extends GetxController {
  var index = 0.obs;

  var doctorNavBar = [
    const HomeView(),
    const AllPatientsByDoctorView(),
    const AllStaffOfDoctorView(),
    const ChatsView(),
  ];
  var adminNavBar = [
    const DashboardView(),
    const AllDoctorsView(),
    const AllPatientsView(),
    const ShowTechniciansView(),
    const ShowStaffMembersView(),
  ];

  var technciansNavbar = [const TechnicianDashboardView(), const ChatsView()];

  var staffsNavbar = [
    // const AllDoctorsView(),
    const AllpatientsviewForStaffView(),
    const ChatsView()
  ];
}
