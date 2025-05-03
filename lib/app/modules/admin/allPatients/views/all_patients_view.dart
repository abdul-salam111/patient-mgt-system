import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customShimmer.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/icons.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/all_patients_controller.dart';

class AllPatientsView extends GetView<AllPatientsController> {
  const AllPatientsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllPatientsController());
    controller.fetchAllPateints();
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
              )
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
                          controller.tempPayload.value = controller
                              .getAllPateintModel.value.payload!
                              .where((element) {
                            return (element.firstName! + element.lastName!)
                                .toString()
                                .toLowerCase()
                                .contains(search.toString().toLowerCase());
                          }).toList();
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
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Row(
            mainAxisAlignment: mainbetween,
            children: [
              CustomText(
                  text: "All Patients",
                  fontSize: 16.sp,
                  color: blackcolor,
                  fontWeight: FontWeight.w600),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.CREATE_PATIENT_BY_ADMIN);
                },
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    minimumSize: const Size(100, 30),
                    backgroundColor: primarycolor),
                child: const Text(
                  "Add patient",
                  style: TextStyle(fontSize: 10, color: whitecolor),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const Expanded(child: ShimmerListView())
              : Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: List.generate(
                        controller.tempPayload.isNotEmpty
                            ? controller.tempPayload.length
                            : controller
                                .getAllPateintModel.value.payload!.length,
                        (index) {
                          if (controller.tempPayload.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text:
                                                    "${controller.tempPayload[index].firstName} ${controller.tempPayload[index].lastName}",
                                                fontSize: 12.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              5.heightBox,
                                              CustomText(
                                                text:
                                                    "${controller.tempPayload[index].patientId}",
                                                fontSize: 11.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w400,
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
                                                        .tempPayload[index]
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
                                              Obx(
                                                () => GestureDetector(
                                                  onTap: () {
                                                    controller.showPopupMenu(
                                                        context,
                                                        controller.tempPayload[
                                                            index]);
                                                  },
                                                  child: SizedBox(
                                                    child: CustomText(
                                                      text: controller
                                                          .tempPayload[index]
                                                          .status!,
                                                      fontSize: 11.sp,
                                                      color: textfieldgrey,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                      .box
                                                      .roundedSM
                                                      .border(color: greyColor)
                                                      .padding(pad5)
                                                      .make(),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  10.heightBox,
                                  Row(
                                    mainAxisAlignment: mainstart,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // print(snapshot
                                          //         .data!.payload![index].files!.map((e)=>e.));
                                        },
                                        child: Image.asset(
                                          folders,
                                          width: 95,
                                        ),
                                      ),
                                      20.widthBox,
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.PATIENT_PROFILE,
                                              arguments: controller
                                                  .getAllPateintModel
                                                  .value
                                                  .payload![index]);
                                        },
                                        child: Image.asset(
                                          view,
                                          width: 95,
                                        ),
                                      ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text:
                                                    "${controller.getAllPateintModel.value.payload![index].firstName} ${controller.getAllPateintModel.value.payload![index].lastName}",
                                                fontSize: 12.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              5.heightBox,
                                              CustomText(
                                                text:
                                                    "${controller.getAllPateintModel.value.payload![index].patientId}",
                                                fontSize: 11.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w400,
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
                                                        .getAllPateintModel
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
                                              Obx(
                                                () => GestureDetector(
                                                  onTap: () {
                                                    controller.showPopupMenu(
                                                        context,
                                                        controller
                                                            .getAllPateintModel
                                                            .value
                                                            .payload![index]);
                                                  },
                                                  child: SizedBox(
                                                    child: CustomText(
                                                      text: controller
                                                          .getAllPateintModel
                                                          .value
                                                          .payload![index]
                                                          .status!,
                                                      fontSize: 11.sp,
                                                      color: textfieldgrey,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                      .box
                                                      .roundedSM
                                                      .border(color: greyColor)
                                                      .padding(pad5)
                                                      .make(),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  10.heightBox,
                                  Row(
                                    mainAxisAlignment: mainstart,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // print(snapshot
                                          //         .data!.payload![index].files!.map((e)=>e.));
                                        },
                                        child: Image.asset(
                                          folders,
                                          width: 95,
                                        ),
                                      ),
                                      20.widthBox,
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.PATIENT_PROFILE,
                                              arguments: controller
                                                  .getAllPateintModel
                                                  .value
                                                  .payload![index]);
                                        },
                                        child: Image.asset(
                                          view,
                                          width: 95,
                                        ),
                                      ),
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
                        },
                      ),
                    ),
                  ),
                ),
        ),
      ],
    ));
  }
}
