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
import '../controllers/all_doctors_controller.dart';

class AllDoctorsView extends GetView<AllDoctorsController> {
  const AllDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final switchController = Get.put(AllDoctorsController());
    controller.fetchDoctors();
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
                              .getAllDoctorsModel.value.payload!
                              .where(
                                (element) => element.name
                                    .toString()
                                    .toLowerCase()
                                    .contains(search.toLowerCase().toString()),
                              )
                              .toList();
                        },
                        style: TextStyle(color: blackcolor, fontSize: 14.sp),
                        decoration: InputDecoration(
                            hintText: "Search doctors...",
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
                  text: "All Doctors",
                  fontSize: 16.sp,
                  color: blackcolor,
                  fontWeight: FontWeight.w600),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.CREATE_NEW_DOCTOR);
                  },
                  child: Image.asset(
                    addnewdoctorbtn,
                    width: 100,
                  ))
            ],
          ),
        ),
        5.heightBox,
        Obx(() => switchController.isLoading.value
            ? const Expanded(child: ShimmerListView())
            : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        switchController.tempPayload.isNotEmpty
                            ? switchController.tempPayload.length
                            : switchController.getAllDoctorsModel.value.payload!
                                .length, (index) {
                      if (switchController.tempPayload.isNotEmpty) {
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
                                  ).box.rounded.clip(Clip.antiAlias).make(),
                                  5.widthBox,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        CustomText(
                                            text: switchController
                                                .tempPayload[index].name!,
                                            fontSize: 12.sp,
                                            color: blackcolor,
                                            fontWeight: FontWeight.w500),
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
                                                text: switchController
                                                    .tempPayload[index].date
                                                    .toString()
                                                    .split(' ')[0],
                                                fontSize: 11.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.w300),
                                          ],
                                        ),
                                        5.heightBox,
                                        // CustomText(
                                        //     text: switchController
                                        //         .getAllDoctorsModel
                                        //         .value
                                        //         .payload![index]
                                        //         .practice!
                                        //         .name!,
                                        //     fontSize: 12.sp,
                                        //     color: textfieldgrey,
                                        //     fontWeight: FontWeight.w300),
                                        10.heightBox,
                                        Container(
                                          width: 160,
                                          height: 1,
                                          color: greyColor,
                                        ),
                                        Row(
                                          mainAxisAlignment: mainbetween,
                                          children: [
                                            CustomText(
                                                text:
                                                    "Permit Doctor For Form Fill :",
                                                fontSize: 10.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.normal),
                                            Obx(() {
                                              return Transform.scale(
                                                scale: 0.5,
                                                child: Switch(
                                                  value: switchController
                                                      .isSwitchedList[index]
                                                      .value,
                                                  onChanged: (value) {
                                                    switchController
                                                        .toggleSwitch(
                                                            index, value);
                                                    switchController
                                                        .updateStatusForDoctor(
                                                            switchController
                                                                .tempPayload[
                                                                    index]
                                                                .id!,
                                                            value ? 1 : 0);
                                                  },
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      delete,
                                      width: 95,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.MESSAGES, arguments: [
                                        switchController.tempPayload[index].id
                                            .toString(),
                                        switchController.tempPayload[index].name
                                      ]);
                                    },
                                    child: Image.asset(
                                      "assets/icons/chatbtn.png",
                                      width: 95,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      edit,
                                      width: 95,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                              .box
                              .white
                              .shadowLg
                              .padding(defaultpad)
                              .rounded
                              .make()
                              .onTap(() {
                            Get.toNamed(Routes.DOCTOR_PROFILE,
                                arguments: switchController.tempPayload[index]);
                          }),
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
                                  ).box.rounded.clip(Clip.antiAlias).make(),
                                  5.widthBox,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: crosstart,
                                      children: [
                                        CustomText(
                                            text: switchController
                                                .getAllDoctorsModel
                                                .value
                                                .payload![index]
                                                .name!,
                                            fontSize: 12.sp,
                                            color: blackcolor,
                                            fontWeight: FontWeight.w500),
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
                                                text: switchController
                                                    .getAllDoctorsModel
                                                    .value
                                                    .payload![index]
                                                    .date
                                                    .toString()
                                                    .split(' ')[0],
                                                fontSize: 11.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.w300),
                                          ],
                                        ),
                                        5.heightBox,
                                        // CustomText(
                                        //     text: switchController
                                        //         .getAllDoctorsModel
                                        //         .value
                                        //         .payload![index]
                                        //         .practice!
                                        //         .name!,
                                        //     fontSize: 12.sp,
                                        //     color: textfieldgrey,
                                        //     fontWeight: FontWeight.w300),
                                        10.heightBox,
                                        Container(
                                          width: 160,
                                          height: 1,
                                          color: greyColor,
                                        ),
                                        Row(
                                          mainAxisAlignment: mainbetween,
                                          children: [
                                            CustomText(
                                                text:
                                                    "Permit Doctor For Form Fill :",
                                                fontSize: 10.sp,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.normal),
                                            Obx(() {
                                              return Transform.scale(
                                                scale: 0.5,
                                                child: Switch(
                                                  value: switchController
                                                      .isSwitchedList[index]
                                                      .value,
                                                  onChanged: (value) {
                                                    switchController
                                                        .toggleSwitch(
                                                            index, value);
                                                    switchController
                                                        .updateStatusForDoctor(
                                                            switchController
                                                                .getAllDoctorsModel
                                                                .value
                                                                .payload![index]
                                                                .id!,
                                                            value ? 1 : 0);
                                                  },
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      delete,
                                      width: 95,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.MESSAGES, arguments: [
                                        controller.getAllDoctorsModel.value
                                            .payload![index].id
                                            .toString(),
                                        controller.getAllDoctorsModel.value
                                            .payload![index].name
                                      ]);
                                    },
                                    child: Image.asset(
                                      "assets/icons/chatbtn.png",
                                      width: 95,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      edit,
                                      width: 95,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                              .box
                              .white
                              .shadowLg
                              .padding(defaultpad)
                              .rounded
                              .make()
                              .onTap(() {
                            Get.toNamed(Routes.DOCTOR_PROFILE,
                                arguments: controller
                                    .getAllDoctorsModel.value.payload![index]);
                          }),
                        );
                      }
                    }),
                  ),
                ),
              )),
      ],
    ));
  }
}
