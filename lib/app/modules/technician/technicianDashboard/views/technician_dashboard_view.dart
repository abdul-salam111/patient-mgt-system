import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customShimmer.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/icons.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../data/getModels/doctor/loginResponseModel.dart';
import '../controllers/technician_dashboard_controller.dart';

class TechnicianDashboardView extends GetView<TechnicianDashboardController> {
  const TechnicianDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(TechnicianDashboardController());
    controller.fetchAllPatients();
    return Scaffold(
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
                      fontWeight: FontWeight.w900),
                  5.heightBox,
                  CustomText(
                      text: "Diabetes Disease",
                      fontSize: 14.sp,
                      color: whitecolor,
                      fontWeight: FontWeight.w300),
                  10.heightBox,
                ],
              ),
              Expanded(child: Container()),
              Image.asset(
                notitificationIcon,
                height: 35,
                width: 35,
              ),
              10.widthBox,
              CircleAvatar(
                radius: 25.r,
                backgroundImage: const NetworkImage(
                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
              ).box.make().onTap(() {
                Get.toNamed(Routes.PROFILE);
              })
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
          padding: const EdgeInsets.only(
              left: 8, right: 8, top: 10), // Adjusted padding
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (search) {
                          controller.tempList.value = controller
                              .getallpatients.value.payload!
                              .where((e) => (e.firstName! + e.lastName!)
                                  .toString()
                                  .toLowerCase()
                                  .contains(search))
                              .toList();
                        },
                        style: TextStyle(color: blackcolor, fontSize: 14.sp),
                        decoration: InputDecoration(
                            hintText: "Search patient...",
                            hintStyle: TextStyle(
                                color: textfieldgrey, fontSize: 14.sp),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20)),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 70.w,
                      child: Center(
                          child: Text(
                        "Search",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      )),
                    ).box.color(primarycolor).rightRounded(value: 10).make()
                  ],
                ).box.white.outerShadow.rounded.make(),
              ),
            ],
          ),
        ),
        10.heightBox,
        Obx(
          () => controller.isloading.value == true
              ? const Expanded(child: ShimmerListView())
              : Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    children: List.generate(
                        controller.tempList.isEmpty
                            ? controller.getallpatients.value.payload!.length
                            : controller.tempList.length, (index) {
                      return controller.tempList.isEmpty
                          ? Padding(
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
                                      ).box.rounded.clip(Clip.antiAlias).make(),
                                      5.widthBox,
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            CustomText(
                                              text:
                                                  "${controller.getallpatients.value.payload![index].firstName} ${controller.getallpatients.value.payload![index].lastName}",
                                              fontSize: 12.sp,
                                              color: blackcolor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            5.heightBox,
                                            CustomText(
                                              text:
                                                  "${controller.getallpatients.value.payload![index].patientId}",
                                              fontSize: 11.sp,
                                              color: blackcolor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            5.heightBox,
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: primarycolor,
                                                  size: 16,
                                                ),
                                                5.widthBox,
                                                CustomText(
                                                  text: controller
                                                      .getallpatients
                                                      .value
                                                      .payload![index]
                                                      .createdAt
                                                      .toString()
                                                      .split(' ')[0],
                                                  fontSize: 11.sp,
                                                  color: textfieldgrey,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ],
                                            ),
                                            5.heightBox,
                                            Row(
                                              children: [
                                                CustomText(
                                                    text: "Status:",
                                                    fontSize: 12.sp,
                                                    color: textfieldgrey,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                10.widthBox,
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SizedBox(
                                                    child: CustomText(
                                                      text: (controller
                                                                      .getallpatients
                                                                      .value
                                                                      .payload![
                                                                          index]
                                                                      .setupTechnician ==
                                                                  signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                                                                      .payload!
                                                                      .user!
                                                                      .name &&
                                                              controller
                                                                      .getallpatients
                                                                      .value
                                                                      .payload![
                                                                          index]
                                                                      .status
                                                                      .toString() ==
                                                                  "Hooked Up")
                                                          ? "In Acquisition"
                                                          : (controller.getallpatients.value.payload![index].status.toString() ==
                                                                      "Pruning" &&
                                                                  controller
                                                                          .getallpatients
                                                                          .value
                                                                          .payload![index]
                                                                          .pruningTechnician ==
                                                                      signInResponseModelFromJson(sharedPrefbox.read(userInformation)).payload!.user!.name)
                                                              ? "Pruning"
                                                              : (controller.getallpatients.value.payload![index].status.toString() == "Disconnected" && controller.getallpatients.value.payload![index].disconnectTechnician == signInResponseModelFromJson(sharedPrefbox.read(userInformation)).payload!.user!.name)
                                                                  ? "Disconnected"
                                                                  : controller.getallpatients.value.payload![index].status.toString() == "Schedule"
                                                                      ? "Hooked Up"
                                                                      : controller.getallpatients.value.payload![index].status.toString(),
                                                      fontSize: 11.sp,
                                                      color: blackcolor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                      .box
                                                      .border(color: greyColor)
                                                      .padding(pad5)
                                                      .roundedSM
                                                      .make(),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  (controller.getallpatients.value.payload![index].status.toString() == "Pruning" &&
                                          controller
                                                  .getallpatients
                                                  .value
                                                  .payload![index]
                                                  .pruningTechnician ==
                                              signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                                                  .payload!
                                                  .user!
                                                  .name)
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: primarycolor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      10)),
                                              fixedSize:
                                                  Size(double.infinity, 30.h),
                                              minimumSize:
                                                  Size(double.infinity, 30.h)),
                                          onPressed: () {
                                            controller.changeStatusToPruning(
                                                controller.getallpatients.value
                                                    .payload![index].id
                                                    .toString(),
                                                controller
                                                        .getallpatients
                                                        .value
                                                        .payload![index]
                                                        .firstName! +
                                                    controller
                                                        .getallpatients
                                                        .value
                                                        .payload![index]
                                                        .lastName!);
                                          },
                                          child: const Text(
                                            "Pruning Complete",
                                            style: TextStyle(color: whitecolor),
                                          ))
                                      : controller.getallpatients.value
                                                  .payload![index].status
                                                  .toString() ==
                                              "Scheduled"
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: primarycolor,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  fixedSize: Size(double.infinity, 30.h),
                                                  minimumSize: Size(double.infinity, 30.h)),
                                              onPressed: () {
                                                controller.changePatientStatus(
                                                    patientId: controller
                                                        .getallpatients
                                                        .value
                                                        .payload![index]
                                                        .id
                                                        .toString(),
                                                    patientName:
                                                        "${controller.getallpatients.value.payload![index].firstName.toString()} ${controller.getallpatients.value.payload![index].lastName.toString()}",
                                                    status: controller
                                                        .getallpatients
                                                        .value
                                                        .payload![index]
                                                        .status
                                                        .toString());
                                              },
                                              child: const Text(
                                                "Hooked Up",
                                                style: TextStyle(
                                                    color: whitecolor),
                                              ))
                                          : (controller.getallpatients.value.payload![index].disconnectTechnician == signInResponseModelFromJson(sharedPrefbox.read(userInformation)).payload!.user!.name && controller.getallpatients.value.payload![index].status.toString() == "Hooked Up")
                                              ? ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor: primarycolor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), fixedSize: Size(double.infinity, 30.h), minimumSize: Size(double.infinity, 30.h)),
                                                  onPressed: () {
                                                    controller.changePatientStatus(
                                                        patientId: controller
                                                            .getallpatients
                                                            .value
                                                            .payload![index]
                                                            .id
                                                            .toString(),
                                                        patientName:
                                                            "${controller.getallpatients.value.payload![index].firstName.toString()} ${controller.getallpatients.value.payload![index].lastName.toString()}",
                                                        status: controller
                                                            .getallpatients
                                                            .value
                                                            .payload![index]
                                                            .status
                                                            .toString());
                                                  },
                                                  child: const Text(
                                                    "Disconnect",
                                                    style: TextStyle(
                                                        color: whitecolor),
                                                  ))
                                              : const SizedBox.shrink()
                                ],
                              )
                                  .box
                                  .white
                                  .outerShadow
                                  .padding(defaultpad)
                                  .rounded
                                  .make(),
                            )
                          : Padding(
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
                                      ).box.rounded.clip(Clip.antiAlias).make(),
                                      5.widthBox,
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            CustomText(
                                              text:
                                                  "${controller.tempList[index].firstName} ${controller.tempList[index].lastName}",
                                              fontSize: 12.sp,
                                              color: blackcolor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            5.heightBox,
                                            CustomText(
                                              text:
                                                  "${controller.tempList[index].patientId}",
                                              fontSize: 11.sp,
                                              color: blackcolor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            5.heightBox,
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: primarycolor,
                                                  size: 16,
                                                ),
                                                5.widthBox,
                                                CustomText(
                                                  text: controller
                                                      .tempList[index].createdAt
                                                      .toString()
                                                      .split(' ')[0],
                                                  fontSize: 11.sp,
                                                  color: textfieldgrey,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ],
                                            ),
                                            5.heightBox,
                                            Row(
                                              children: [
                                                CustomText(
                                                    text: "Status:",
                                                    fontSize: 12.sp,
                                                    color: textfieldgrey,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                10.widthBox,
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SizedBox(
                                                    child: CustomText(
                                                      text: (controller.tempList[index].setupTechnician ==
                                                                  signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                                                                      .payload!
                                                                      .user!
                                                                      .name &&
                                                              controller.tempList[index].status
                                                                      .toString() ==
                                                                  "Hooked Up")
                                                          ? "In Acquisition"
                                                          : (controller.tempList[index].status.toString() ==
                                                                      "Pruning" &&
                                                                  controller.tempList[index].pruningTechnician ==
                                                                      signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                                                                          .payload!
                                                                          .user!
                                                                          .name)
                                                              ? "Pruning"
                                                              : (controller.tempList[index].status.toString() == "Disconnected" &&
                                                                      controller.tempList[index].disconnectTechnician ==
                                                                          signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                                                                              .payload!
                                                                              .user!
                                                                              .name)
                                                                  ? "Disconnected"
                                                                  : controller.tempList[index].status.toString() ==
                                                                          "Schedule"
                                                                      ? "Hooked Up"
                                                                      : controller
                                                                          .tempList[index]
                                                                          .status
                                                                          .toString(),
                                                      fontSize: 11.sp,
                                                      color: blackcolor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                      .box
                                                      .border(color: greyColor)
                                                      .padding(pad5)
                                                      .roundedSM
                                                      .make(),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  (controller.tempList[index].status.toString() ==
                                              "Pruning" &&
                                          controller.tempList[index].pruningTechnician ==
                                              signInResponseModelFromJson(sharedPrefbox.read(userInformation))
                                                  .payload!
                                                  .user!
                                                  .name)
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: primarycolor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      10)),
                                              fixedSize:
                                                  Size(double.infinity, 30.h),
                                              minimumSize:
                                                  Size(double.infinity, 30.h)),
                                          onPressed: () {
                                            controller.changeStatusToPruning(
                                                controller.tempList[index].id
                                                    .toString(),
                                                controller.tempList[index]
                                                        .firstName! +
                                                    controller.tempList[index]
                                                        .lastName!);
                                          },
                                          child: const Text(
                                            "Pruning Complete",
                                            style: TextStyle(color: whitecolor),
                                          ))
                                      : controller.tempList[index].status.toString() ==
                                              "Scheduled"
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: primarycolor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)),
                                                  fixedSize: Size(double.infinity, 30.h),
                                                  minimumSize: Size(double.infinity, 30.h)),
                                              onPressed: () {
                                                controller.changePatientStatus(
                                                    patientId: controller
                                                        .tempList[index].id
                                                        .toString(),
                                                    patientName:
                                                        "${controller.tempList[index].firstName.toString()} ${controller.tempList[index].lastName.toString()}",
                                                    status: controller
                                                        .tempList[index].status
                                                        .toString());
                                              },
                                              child: const Text(
                                                "Hooked Up",
                                                style: TextStyle(
                                                    color: whitecolor),
                                              ))
                                          : (controller.tempList[index].disconnectTechnician == signInResponseModelFromJson(sharedPrefbox.read(userInformation)).payload!.user!.name && controller.tempList[index].status.toString() == "Hooked Up")
                                              ? ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor: primarycolor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), fixedSize: Size(double.infinity, 30.h), minimumSize: Size(double.infinity, 30.h)),
                                                  onPressed: () {
                                                    controller.changePatientStatus(
                                                        patientId: controller
                                                            .tempList[index].id
                                                            .toString(),
                                                        patientName:
                                                            "${controller.tempList[index].firstName.toString()} ${controller.tempList[index].lastName.toString()}",
                                                        status: controller
                                                            .tempList[index]
                                                            .status
                                                            .toString());
                                                  },
                                                  child: const Text(
                                                    "Disconnect",
                                                    style: TextStyle(
                                                        color: whitecolor),
                                                  ))
                                              : const SizedBox.shrink()
                                ],
                              )
                                  .box
                                  .white
                                  .outerShadow
                                  .padding(defaultpad)
                                  .rounded
                                  .make(),
                            );
                    }),
                  )),
                ),
        )
      ],
    ));
  }
}
