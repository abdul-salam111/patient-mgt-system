import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/app/commonWidgets/customShimmer.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/data/getModels/patient/getAllPateintModel.dart';
import 'package:patient_management/app/modules/admin/Dashboard/controllers/dashboard_controller.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/icons.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    controller.fetchAlldoctors();
    controller.fetchAllPateints();

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: pad16,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: mainend,
                    crossAxisAlignment: crosstart,
                    children: [
                      CustomText(
                        text:
                            "Hi, ${signInResponseModelFromJson(sharedPrefbox.read(userInformation)).payload!.user!.name}",
                        fontSize: 22.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.w900,
                      ),
                      35.heightBox,
                    ],
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFICATIONS);
                    },
                    child: Image.asset(
                      notitificationIcon,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  10.widthBox,
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: const NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                    ),
                  ).box.make().onTap(() {
                    Get.toNamed(Routes.ADMINPROFILE);
                  }),
                ],
              ),
            )
                .box
                .height(150)
                .color(primarycolor)
                .width(double.infinity)
                .bottomRounded(value: 30)
                .make(),
            Padding(
              padding: pad16,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: crossend,
                    mainAxisAlignment: mainbetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CREATE_CODES);
                        },
                        child: Image.asset(
                          "assets/icons/addnewcode.png",
                          width: 100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CHATS);
                        },
                        child: Image.asset(
                          "assets/icons/chats.png",
                          width: 90,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SHOW_PRACTICES);
                        },
                        child: Image.asset(
                          "assets/icons/practices.png",
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  TabBar(
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      color: primarycolor,
                    ),
                    unselectedLabelColor: textfieldgrey,
                    dividerColor: whitecolor,
                    indicatorColor: primarycolor,
                    tabs: const [
                      Tab(text: "All patient"),
                      Tab(text: "All Doctors"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (search) {
                                        if (search.isNotEmpty) {
                                          controller.tempPatientsList.value =
                                              controller.getAllPateintModel
                                                  .value.payload!
                                                  .where((element) => (element
                                                              .firstName! +
                                                          element.lastName!)
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(search
                                                          .toString()
                                                          .toLowerCase()))
                                                  .toList();
                                        } else {
                                          controller.tempPatientsList.value =
                                              [];
                                        }
                                      },
                                      style: TextStyle(
                                        color: blackcolor,
                                        fontSize: 14.sp,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Search patients...",
                                        hintStyle: TextStyle(
                                          color: textfieldgrey,
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    width: 70.w,
                                    child: Center(
                                      child: Text(
                                        "Search",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                      .box
                                      .color(primarycolor)
                                      .rightRounded(value: 10)
                                      .make()
                                ],
                              ).box.white.outerShadow.rounded.make(),
                            ),
                            5.widthBox,
                          ],
                        ),
                      ),
                      10.heightBox,
                      FutureBuilder(
                          future: controller.fetchAllPateints(),
                          builder:
                              (context, AsyncSnapshot<GetAllPatient> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Expanded(child: ShimmerListView());
                            } else if (!snapshot.hasData) {
                              return const Center(
                                child: Text("No pateint is added yet."),
                              );
                            }
                            return Obx(
                              () => Expanded(
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: List.generate(
                                      controller.tempPatientsList.isNotEmpty
                                          ? controller.tempPatientsList.length
                                          : snapshot.data!.payload!.length,
                                      (index) {
                                    if (controller
                                            .tempPatientsList.isNotEmpty &&
                                        controller.tempPatientsList != []) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Row(
                                              crossAxisAlignment: crosstart,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(
                                                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                                    .box
                                                    .rounded
                                                    .clip(Clip.antiAlias)
                                                    .make(),
                                                5.widthBox,
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        crosstart,
                                                    children: [
                                                      CustomText(
                                                        text:
                                                            "${controller.tempPatientsList[index].firstName} ${controller.tempPatientsList[index].lastName}",
                                                        fontSize: 12.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      5.heightBox,
                                                      CustomText(
                                                        text:
                                                            "${controller.tempPatientsList[index].patientId}",
                                                        fontSize: 11.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      5.heightBox,
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_month_rounded,
                                                            color: primarycolor,
                                                            size: 16,
                                                          ),
                                                          5.widthBox,
                                                          CustomText(
                                                            text: controller
                                                                .tempPatientsList[
                                                                    index]
                                                                .createdAt
                                                                .toString()
                                                                .split(' ')[0],
                                                            fontSize: 11.sp,
                                                            color:
                                                                textfieldgrey,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ],
                                                      ),
                                                      5.heightBox,
                                                      Obx(
                                                        () => GestureDetector(
                                                            onTap: () {
                                                              controller.showPopupMenu(
                                                                  context,
                                                                  controller
                                                                          .tempPatientsList[
                                                                      index]);
                                                            },
                                                            child: SizedBox(
                                                              child: CustomText(
                                                                text: controller
                                                                    .tempPatientsList[
                                                                        index]
                                                                    .status!,
                                                                fontSize: 11.sp,
                                                                color:
                                                                    textfieldgrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            )
                                                                .box
                                                                .border(
                                                                    color:
                                                                        greyColor)
                                                                .padding(pad5)
                                                                .roundedSM
                                                                .make()),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment: mainstart,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.PATIENTFILES,
                                                        arguments: controller
                                                            .tempPatientsList);
                                                  },
                                                  child: Image.asset(
                                                    folders,
                                                    width: 95,
                                                  ),
                                                ),
                                                20.widthBox,
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.PATIENT_PROFILE,
                                                        arguments: controller
                                                                .tempPatientsList[
                                                            index]);
                                                  },
                                                  child: Image.asset(
                                                    view,
                                                    width: 95,
                                                  ),
                                                ),
                                                // Image.asset(
                                                //   edit,
                                                //   width: 95,
                                                // ),
                                              ],
                                            )
                                          ],
                                        )
                                            .box
                                            .white
                                            .outerShadow
                                            .padding(defaultpad)
                                            .rounded
                                            .make(),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Row(
                                              crossAxisAlignment: crosstart,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(
                                                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                                    .box
                                                    .rounded
                                                    .clip(Clip.antiAlias)
                                                    .make(),
                                                5.widthBox,
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        crosstart,
                                                    children: [
                                                      CustomText(
                                                        text:
                                                            "${snapshot.data!.payload![index].firstName} ${snapshot.data!.payload![index].lastName}",
                                                        fontSize: 12.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      5.heightBox,
                                                      CustomText(
                                                        text:
                                                            "${snapshot.data!.payload![index].patientId}",
                                                        fontSize: 11.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      5.heightBox,
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_month_rounded,
                                                            color: primarycolor,
                                                            size: 16,
                                                          ),
                                                          5.widthBox,
                                                          CustomText(
                                                            text: snapshot
                                                                .data!
                                                                .payload![index]
                                                                .createdAt
                                                                .toString()
                                                                .split(' ')[0],
                                                            fontSize: 11.sp,
                                                            color:
                                                                textfieldgrey,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ],
                                                      ),
                                                      5.heightBox,
                                                      Obx(
                                                        () => GestureDetector(
                                                            onTap: () {
                                                              controller.showPopupMenu(
                                                                  context,
                                                                  snapshot.data!
                                                                          .payload![
                                                                      index]);
                                                            },
                                                            child: SizedBox(
                                                              child: CustomText(
                                                                text: controller
                                                                    .getAllPateintModel
                                                                    .value
                                                                    .payload![
                                                                        index]
                                                                    .status!,
                                                                fontSize: 11.sp,
                                                                color:
                                                                    textfieldgrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            )
                                                                .box
                                                                .border(
                                                                    color:
                                                                        greyColor)
                                                                .padding(pad5)
                                                                .roundedSM
                                                                .make()),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment: mainstart,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.PATIENTFILES,
                                                        arguments: snapshot
                                                            .data!
                                                            .payload![index]);
                                                  },
                                                  child: Image.asset(
                                                    folders,
                                                    width: 95,
                                                  ),
                                                ),
                                                20.widthBox,
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.PATIENT_PROFILE,
                                                        arguments: snapshot
                                                            .data!
                                                            .payload![index]);
                                                  },
                                                  child: Image.asset(
                                                    view,
                                                    width: 95,
                                                  ),
                                                ),
                                                // Image.asset(
                                                //   edit,
                                                //   width: 95,
                                                // ),
                                              ],
                                            )
                                          ],
                                        )
                                            .box
                                            .white
                                            .outerShadow
                                            .padding(defaultpad)
                                            .rounded
                                            .make(),
                                      );
                                    }
                                  }),
                                )),
                              ),
                            );
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (search) {
                                        controller.tempDoctorsList.value =
                                            controller.getAllDoctorsModel.value
                                                .payload!
                                                .where((element) =>
                                                    (element.name)
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(search
                                                            .toString()
                                                            .toLowerCase()))
                                                .toList();
                                        controller.update();
                                      },
                                      style: TextStyle(
                                        color: blackcolor,
                                        fontSize: 14.sp,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Search Doctors...",
                                        hintStyle: TextStyle(
                                          color: textfieldgrey,
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    width: 70.w,
                                    child: Center(
                                      child: Text(
                                        "Search",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                      .box
                                      .color(primarycolor)
                                      .rightRounded(value: 10)
                                      .make()
                                ],
                              ).box.white.outerShadow.rounded.make(),
                            ),
                            5.widthBox,
                          ],
                        ),
                      ),
                      Obx(() => controller.isloading.value == true
                          ? const Expanded(child: ShimmerListView())
                          : Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                      controller.tempDoctorsList.isNotEmpty
                                          ? controller.tempDoctorsList.length
                                          : controller.getAllDoctorsModel.value
                                              .payload!.length, (index) {
                                    if (controller.tempDoctorsList.isNotEmpty) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Row(
                                              crossAxisAlignment: crosstart,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(
                                                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                                    .box
                                                    .rounded
                                                    .clip(Clip.antiAlias)
                                                    .make(),
                                                5.widthBox,
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        crosstart,
                                                    children: [
                                                      CustomText(
                                                        text: controller
                                                            .tempDoctorsList[
                                                                index]
                                                            .name!,
                                                        fontSize: 12.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      5.heightBox,
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_month_rounded,
                                                            color: primarycolor,
                                                            size: 16,
                                                          ),
                                                          5.widthBox,
                                                          CustomText(
                                                            text: controller
                                                                .tempDoctorsList[
                                                                    index]
                                                                .date
                                                                .toString()
                                                                .split(' ')[0],
                                                            fontSize: 11.sp,
                                                            color:
                                                                textfieldgrey,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ],
                                                      ),
                                                      5.heightBox,
                                                      CustomText(
                                                        text: controller
                                                            .tempDoctorsList[
                                                                index]
                                                            .practice!
                                                            .name!,
                                                        fontSize: 12.sp,
                                                        color: textfieldgrey,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                      5.heightBox,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            10.heightBox,
                                            Row(
                                              mainAxisAlignment: mainbetween,
                                              children: [
                                                Image.asset(
                                                  folders,
                                                  width: 100,
                                                ),
                                                Image.asset(
                                                  delete,
                                                  width: 100,
                                                ),
                                                Image.asset(
                                                  edit,
                                                  width: 100,
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                            .box
                                            .white
                                            .shadowLg
                                            .padding(defaultpad)
                                            .rounded
                                            .make(),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            Row(
                                              crossAxisAlignment: crosstart,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Image.network(
                                                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                                    .box
                                                    .rounded
                                                    .clip(Clip.antiAlias)
                                                    .make(),
                                                5.widthBox,
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        crosstart,
                                                    children: [
                                                      CustomText(
                                                        text: controller
                                                            .getAllDoctorsModel
                                                            .value
                                                            .payload![index]
                                                            .name!,
                                                        fontSize: 12.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      5.heightBox,
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_month_rounded,
                                                            color: primarycolor,
                                                            size: 16,
                                                          ),
                                                          5.widthBox,
                                                          CustomText(
                                                            text: controller
                                                                .getAllDoctorsModel
                                                                .value
                                                                .payload![index]
                                                                .date
                                                                .toString()
                                                                .split(' ')[0],
                                                            fontSize: 11.sp,
                                                            color:
                                                                textfieldgrey,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ],
                                                      ),
                                                      5.heightBox,
                                                      CustomText(
                                                        text: controller
                                                            .getAllDoctorsModel
                                                            .value
                                                            .payload![index]
                                                            .practice!
                                                            .name!,
                                                        fontSize: 12.sp,
                                                        color: textfieldgrey,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                      5.heightBox,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                            .box
                                            .white
                                            .shadowLg
                                            .padding(defaultpad)
                                            .rounded
                                            .make(),
                                      );
                                    }
                                  }),
                                ),
                              ),
                            )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
