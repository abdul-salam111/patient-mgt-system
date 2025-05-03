import 'package:get/get.dart';

import '../modules/admin/CreateStaff/bindings/create_staff_binding.dart';
import '../modules/admin/CreateStaff/views/create_staff_view.dart';
import '../modules/admin/Dashboard/bindings/dashboard_binding.dart';
import '../modules/admin/Dashboard/views/dashboard_view.dart';
import '../modules/admin/adminprofile/bindings/adminprofile_binding.dart';
import '../modules/admin/adminprofile/views/adminprofile_view.dart';
import '../modules/admin/allDoctors/bindings/all_doctors_binding.dart';
import '../modules/admin/allDoctors/views/all_doctors_view.dart';
import '../modules/admin/allPatients/bindings/all_patients_binding.dart';
import '../modules/admin/allPatients/views/all_patients_view.dart';
import '../modules/admin/createNewDoctor/bindings/create_new_doctor_binding.dart';
import '../modules/admin/createNewDoctor/views/create_new_doctor_view.dart';
import '../modules/admin/createTechnician/bindings/create_technician_binding.dart';
import '../modules/admin/createTechnician/views/create_technician_view.dart';
import '../modules/admin/doctorProfile/bindings/doctor_profile_binding.dart';
import '../modules/admin/doctorProfile/views/doctor_profile_view.dart';
import '../modules/admin/notifications/bindings/notifications_binding.dart';
import '../modules/admin/notifications/views/notifications_view.dart';
import '../modules/admin/patientProfile/bindings/patient_profile_binding.dart';
import '../modules/admin/patientProfile/views/patient_profile_view.dart';
import '../modules/admin/patientfiles/bindings/patientfiles_binding.dart';
import '../modules/admin/patientfiles/views/patientfiles_view.dart';
import '../modules/admin/showStaffMembers/bindings/show_staff_members_binding.dart';
import '../modules/admin/showStaffMembers/views/show_staff_members_view.dart';
import '../modules/admin/showTechnicians/bindings/show_technicians_binding.dart';
import '../modules/admin/showTechnicians/views/show_technicians_view.dart';
import '../modules/admin/showtechnicianProfile/bindings/showtechnician_profile_binding.dart';
import '../modules/admin/showtechnicianProfile/views/showtechnician_profile_view.dart';
import '../modules/common/changePassword/bindings/change_password_binding.dart';
import '../modules/common/changePassword/views/change_password_view.dart';
import '../modules/common/chats/bindings/chats_binding.dart';
import '../modules/common/chats/views/chats_view.dart';
import '../modules/common/messages/bindings/messages_binding.dart';
import '../modules/common/messages/views/messages_view.dart';
import '../modules/common/navBar/bindings/nav_bar_binding.dart';
import '../modules/common/navBar/views/nav_bar_view.dart';
import '../modules/common/profile/bindings/profile_binding.dart';
import '../modules/common/profile/views/profile_view.dart';
import '../modules/common/signin/bindings/signin_binding.dart';
import '../modules/common/signin/views/signin_view.dart';
import '../modules/common/signup/bindings/signup_binding.dart';
import '../modules/common/signup/views/signup_view.dart';
import '../modules/common/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/common/splashscreen/views/splashscreen_view.dart';
import '../modules/admin/createPatientByAdmin/bindings/create_patient_by_admin_binding.dart';
import '../modules/admin/createPatientByAdmin/views/create_patient_by_admin_view.dart';
import '../modules/doctor/allPatientsByDoctor/bindings/all_patientsByDoctor_binding.dart';
import '../modules/doctor/allPatientsByDoctor/views/all_patientsByDoctor_view.dart';
import '../modules/doctor/createPatient/bindings/create_patient_binding.dart';
import '../modules/doctor/createPatient/views/create_patient_view.dart';
import '../modules/doctor/doctorDashboard/bindings/home_binding.dart';
import '../modules/doctor/doctorDashboard/views/home_view.dart';
import '../modules/doctor/patientsStatus/bindings/patients_status_binding.dart';
import '../modules/doctor/patientsStatus/views/patients_status_view.dart';
import '../modules/doctor/profilePage/bindings/profile_page_binding.dart';
import '../modules/doctor/profilePage/views/profile_page_view.dart';
import '../modules/practices/ShowPractices/bindings/show_practices_binding.dart';
import '../modules/practices/ShowPractices/views/show_practices_view.dart';
import '../modules/practices/createCodes/bindings/create_code_binding.dart';
import '../modules/practices/createCodes/views/create_code_view.dart';
import '../modules/practices/createPractice/bindings/create_practice_binding.dart';
import '../modules/practices/createPractice/views/create_practice_view.dart';
import '../modules/staff/allpatientsviewForStaff/bindings/allpatientsview_for_staff_binding.dart';
import '../modules/staff/allpatientsviewForStaff/views/allpatientsview_for_staff_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ALL_DOCTORS,
      page: () => const AllDoctorsView(),
      binding: AllDoctorsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PATIENTS,
      page: () => const AllPatientsView(),
      binding: AllPatientsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PATIENTS_STATUS,
      page: () => const PatientsStatusView(),
      binding: PatientsStatusBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      // binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PATIENT,
      page: () => const CreatePatientView(),
      binding: CreatePatientBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_DOCTOR,
      page: () => const CreateNewDoctorView(),
      binding: CreateNewDoctorBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.ADMINPROFILE,
      page: () => const AdminprofileView(),
      binding: AdminprofileBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_STAFF,
      page: () => const CreateStaffView(),
      binding: CreateStaffBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TECHNICIAN,
      page: () => const CreateTechnicianView(),
      binding: CreateTechnicianBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_TECHNICIANS,
      page: () => const ShowTechniciansView(),
      binding: ShowTechniciansBinding(),
    ),
    GetPage(
      name: _Paths.SHOWTECHNICIAN_PROFILE,
      page: () => const ShowtechnicianProfileView(),
      binding: ShowtechnicianProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_STAFF_MEMBERS,
      page: () => const ShowStaffMembersView(),
      binding: ShowStaffMembersBinding(),
    ),
    GetPage(
      name: _Paths.PATIENT_PROFILE,
      page: () => const PatientProfileView(),
      binding: PatientProfileBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_PROFILE,
      page: () => const DoctorProfileView(),
      binding: DoctorProfileBinding(),
    ),
    GetPage(
      name: _Paths.PATIENTFILES,
      page: () => const PatientfilesView(),
      binding: PatientfilesBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => const MessagesView(),
      // binding: MessagesBinding(),
    ),
    GetPage(
      name: _Paths.ALLPATIENTSVIEW_FOR_STAFF,
      page: () => const AllpatientsviewForStaffView(),
      binding: AllpatientsviewForStaffBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_PRACTICES,
      page: () => const ShowPracticesView(),
      binding: ShowPracticesBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRACTICE,
      page: () => const CreatePracticeView(),
      binding: CreatePracticeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_CODES,
      page: () => const CreateCodeView(),
      binding: CreateCodeBinding(),
    ),
    GetPage(
      name: _Paths.All_PATIENTSBYDOCTOR,
      page: () => const AllPatientsByDoctorView(),
      binding: AllPatientsByDoctorBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PATIENT_BY_ADMIN,
      page: () => const CreatePatientByAdminView(),
      binding: CreatePatientByAdminBinding(),
    ),
  ];
}
