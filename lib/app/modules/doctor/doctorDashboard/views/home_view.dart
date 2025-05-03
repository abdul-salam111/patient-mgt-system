import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customShimmer.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/modules/doctor/createPatient/views/create_patient_view.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/icons.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/resources/physics.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE_PAGE);
                },
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                ),
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
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: pad16,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (search) {
                              controller.tempList.value = controller
                                  .getAllPateintModel.value.payload!
                                  .where((e) => (e.firstName! + e.lastName!)
                                      .toString()
                                      .toLowerCase()
                                      .contains(search))
                                  .toList();
                            },
                            style:
                                TextStyle(color: blackcolor, fontSize: 14.sp),
                            decoration: InputDecoration(
                                hintText: "Search patients...",
                                hintStyle: TextStyle(
                                    color: textfieldgrey, fontSize: 14.sp),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20)),
                          ),
                        ),
                        SizedBox(
                          height: 46.h,
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
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.CREATE_PATIENT);
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
                    ),

                    Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        CustomText(
                            text: "Dashboard",
                            fontSize: 22.sp,
                            color: blackcolor,
                            fontWeight: FontWeight.w900),
                        (signInResponseModelFromJson(
                                        sharedPrefbox.read(userInformation))
                                    .payload!
                                    .user!
                                    .fillOutForm ==
                                1)
                            ? GestureDetector(
                                onTap: () {
                                  Get.to(() => const CreatePatientView());
                                },
                                child: Image.asset(
                                  addpatbtn,
                                  width: 150,
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                    // 20.heightBox,
                    // const Row(
                    //   mainAxisAlignment: mainbetween,
                    //   children: [
                    //     CustomInfoCard(
                    //         backgroundColor: primarycolor,
                    //         headerText: "200K",
                    //         bodyText: "Total \nDoctors",
                    //         imageUrl: totaldoctors),
                    //     CustomInfoCard(
                    //         backgroundColor: Colors.red,
                    //         headerText: "200K",
                    //         bodyText: "Total \nPatient",
                    //         imageUrl: totalpatient),
                    //   ],
                    // ),
                    // 20.heightBox,
                    // const Row(
                    //   mainAxisAlignment: mainbetween,
                    //   children: [
                    //     CustomInfoCard(
                    //         backgroundColor: Color(0xffE09400),
                    //         headerText: "200K",
                    //         bodyText: "Total \nAppointments",
                    //         imageUrl: totalappointments),
                    //     CustomInfoCard(
                    //         backgroundColor: Color(0xff008CED),
                    //         headerText: "200K",
                    //         bodyText: "Total \nIncome",
                    //         imageUrl: totalincome),
                    //   ],
                    // ),

                    // Row(
                    //   mainAxisAlignment: mainend,
                    //   children: [
                    //     // CustomText(
                    //     //     text: "Recent Patients",
                    //     //     fontSize: 22.sp,
                    //     //     color: blackcolor,
                    //     //     fontWeight: FontWeight.w900),
                    //     GestureDetector(
                    //       onTap: (){
                    //         Get.toNamed(Routes.ALL_PATIENTS);
                    //       },
                    //       child: Image.asset(
                    //         viewall,
                    //         width: 70,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
              Obx(
                () => controller.isloading.value == true
                    ? const ShimmerListView()
                    : ListView.builder(
                        physics: neverscroll,
                        itemCount: controller.tempList.isEmpty
                            ? controller
                                .getAllPateintModel.value.payload!.length
                            : controller.tempList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (controller.tempList.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: crosstart,
                                children: [
                                  Row(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        height: 140,
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
                                                    "${controller.tempList[index].firstName.toString()} ${controller.tempList[index].lastName.toString()}",
                                                fontSize: 16.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w700),
                                            5.heightBox,
                                            CustomText(
                                                text: controller
                                                    .tempList[index].patientId
                                                    .toString(),
                                                fontSize: 16.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w700),
                                            5.heightBox,
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: primarycolor,
                                                ),
                                                5.widthBox,
                                                CustomText(
                                                    text: controller
                                                        .tempList[index]
                                                        .createdAt
                                                        .toString()
                                                        .split(' ')[0],
                                                    fontSize: 12.sp,
                                                    color: textfieldgrey,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ],
                                            ),
                                            // 5.heightBox,
                                            // CustomText(
                                            //     text: "Diabetes Disease",
                                            //     fontSize: 12.sp,
                                            //     color: textfieldgrey,
                                            //     fontWeight: FontWeight.w300),
                                            5.heightBox,
                                            CustomText(
                                                text: controller
                                                    .tempList[index].status!,
                                                fontSize: 12.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.bold),
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
                                        delete,
                                        width: 95,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.PATIENT_PROFILE,
                                              arguments:
                                                  controller.tempList[index]);
                                        },
                                        child: Image.asset(
                                          view,
                                          width: 95,
                                        ),
                                      ),
                                      Image.asset(
                                        edit,
                                        width: 95,
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
                                crossAxisAlignment: crosstart,
                                children: [
                                  Row(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        height: 140,
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
                                                    "${controller.getAllPateintModel.value.payload![index].firstName.toString()} ${controller.getAllPateintModel.value.payload![index].lastName.toString()}",
                                                fontSize: 16.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w700),
                                            5.heightBox,
                                            CustomText(
                                                text: controller
                                                    .getAllPateintModel
                                                    .value
                                                    .payload![index]
                                                    .patientId
                                                    .toString(),
                                                fontSize: 16.sp,
                                                color: blackcolor,
                                                fontWeight: FontWeight.w700),
                                            5.heightBox,
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month_rounded,
                                                  color: primarycolor,
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
                                                    fontSize: 12.sp,
                                                    color: textfieldgrey,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ],
                                            ),
                                            // 5.heightBox,
                                            // CustomText(
                                            //     text: "Diabetes Disease",
                                            //     fontSize: 12.sp,
                                            //     color: textfieldgrey,
                                            //     fontWeight: FontWeight.w300),
                                            5.heightBox,
                                            CustomText(
                                                text: controller
                                                    .getAllPateintModel
                                                    .value
                                                    .payload![index]
                                                    .status!,
                                                fontSize: 12.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.bold),
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
                                        delete,
                                        width: 95,
                                      ),
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
                                      Image.asset(
                                        edit,
                                        width: 95,
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
                        }),
              )
            ],
          ),
        )
      ],
    ));
  }
}
