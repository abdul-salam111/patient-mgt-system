import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/icons.dart';
import 'package:patient_management/app/resources/storageServices.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    String role =
        signInResponseModelFromJson(sharedPrefbox.read(userInformation))
            .payload!
            .role![0];

    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: whitecolor,
            currentIndex: controller.index.value,
            onTap: (val) {
              controller.index.value = val;
            },
            selectedFontSize: 13.sp,
            selectedItemColor: primarycolor,
            items: role == "admin"
                ? [
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          dashboard,
                          width: 40,
                          height: 40,
                          color: controller.index.value == 0
                              ? primarycolor
                              : textfieldgrey,
                        ),
                        label: "Dashboard"),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          doctorIcon,
                          width: 40,
                          height: 40,
                          color: controller.index.value == 1
                              ? primarycolor
                              : textfieldgrey,
                        ),
                        label: "All Doctors"),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          allpatient,
                          width: 40,
                          height: 40,
                          color: controller.index.value == 2
                              ? primarycolor
                              : textfieldgrey,
                        ),
                        label: "All Patients"),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          doctorIcon,
                          width: 40,
                          height: 40,
                          color: controller.index.value == 3
                              ? primarycolor
                              : textfieldgrey,
                        ),
                        label: "All Technicians"),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          allpatient,
                          width: 40,
                          height: 40,
                          color: controller.index.value == 3
                              ? primarycolor
                              : textfieldgrey,
                        ),
                        label: "Staff Members"),
                  ]
                : role == "doctor"
                    ? [
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              dashboard,
                              width: 40,
                              height: 40,
                              color: controller.index.value == 0
                                  ? primarycolor
                                  : textfieldgrey,
                            ),
                            label: "Dashboard"),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              allpatient,
                              width: 40,
                              height: 40,
                              color: controller.index.value == 1
                                  ? primarycolor
                                  : textfieldgrey,
                            ),
                            label: "All Patients"),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              allpatient,
                              width: 40,
                              height: 40,
                              color: controller.index.value == 2
                                  ? primarycolor
                                  : textfieldgrey,
                            ),
                            label: "All Staff"),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              chat,
                              width: 40,
                              height: 40,
                              color: controller.index.value == 3
                                  ? primarycolor
                                  : textfieldgrey,
                            ),
                            label: "Chats"),
                      ]
                    : role == "staff"
                        ? [
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  allpatient,
                                  width: 40,
                                  height: 40,
                                  color: controller.index.value == 0
                                      ? primarycolor
                                      : textfieldgrey,
                                ),
                                label: "All patients"),
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  chat,
                                  width: 40,
                                  height: 40,
                                  color: controller.index.value == 1
                                      ? primarycolor
                                      : textfieldgrey,
                                ),
                                label: "Chats"),
                          ]
                        : [
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  dashboard,
                                  width: 40,
                                  height: 40,
                                  color: controller.index.value == 0
                                      ? primarycolor
                                      : textfieldgrey,
                                ),
                                label: "Dashboard"),
                            BottomNavigationBarItem(
                                icon: Image.asset(
                                  chat,
                                  width: 40,
                                  height: 40,
                                  color: controller.index.value == 1
                                      ? primarycolor
                                      : textfieldgrey,
                                ),
                                label: "Chats"),
                          ],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        body: Obx(() => role == "admin"
            ? controller.adminNavBar.elementAt(controller.index.value)
            : role == "doctor"
                ? controller.doctorNavBar.elementAt(controller.index.value)
                : role == "staff"
                    ? controller.staffsNavbar.elementAt(controller.index.value)
                    : controller.technciansNavbar
                        .elementAt(controller.index.value)));
  }
}
