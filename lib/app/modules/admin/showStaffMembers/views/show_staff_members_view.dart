import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customShimmer.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/data/getModels/staff/getAllStaffModel.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/icons.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/show_staff_members_controller.dart';

class ShowStaffMembersView extends GetView<ShowStaffMembersController> {
  const ShowStaffMembersView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ShowStaffMembersController());
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
                              .staffList.value.payload!
                              .where((element) => element.name
                                  .toString()
                                  .toLowerCase()
                                  .contains(search.toString().toLowerCase()))
                              .toList();
                        },
                        style: TextStyle(color: blackcolor, fontSize: 14.sp),
                        decoration: InputDecoration(
                            hintText: "Search staff...",
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
                  text: "All Staff Members",
                  fontSize: 16.sp,
                  color: blackcolor,
                  fontWeight: FontWeight.w600),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.CREATE_STAFF, arguments: [null, false]);
                },
                child: Image.asset(
                  addstaff,
                  width: 100,
                ),
              )
            ],
          ),
        ),
        10.heightBox,
        FutureBuilder(
            future: controller.getallstaffMembers(),
            builder: (context, AsyncSnapshot<GetAllStaffMembers> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(child: ShimmerListView());
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("No staff added yet."),
                );
              } else {
                return Obx(
                  () => Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          controller.tempPayload.isNotEmpty
                              ? controller.tempPayload.length
                              : snapshot.data!.payload!.length,
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
                                        )
                                            .box
                                            .rounded
                                            .clip(Clip.antiAlias)
                                            .make(),
                                        5.widthBox,
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text:
                                                      "${controller.tempPayload[index].name}",
                                                  fontSize: 12.sp,
                                                  color: blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                5.heightBox,
                                                controller.tempPayload[index]
                                                            .practice !=
                                                        null
                                                    ? CustomText(
                                                        text:
                                                            "${controller.tempPayload[index].practice!.name}",
                                                        fontSize: 11.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )
                                                    : const SizedBox.shrink(),
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
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ],
                                                ),
                                                5.heightBox,
                                              ],
                                            ))
                                      ],
                                    ),
                                    10.heightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                              AlertDialog(
                                                title: const Text(
                                                  'Confirm Deletion',
                                                  style: TextStyle(
                                                      color: blackcolor),
                                                ),
                                                content: const Text(
                                                    'Are you sure you want to delete this Staff Member?',
                                                    style: TextStyle(
                                                        color: blackcolor)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Get.back(),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      controller
                                                          .deleteStaffMember(
                                                              controller
                                                                  .tempPayload[
                                                                      index]
                                                                  .id!);
                                                      Get.back();
                                                    },
                                                    child: const Text('Delete',
                                                        style: TextStyle(
                                                            color: redColor)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            delete,
                                            width: 95,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.MESSAGES,
                                                arguments: [
                                                  controller
                                                      .tempPayload[index].id
                                                      .toString(),
                                                  controller
                                                      .tempPayload[index].name,
                                                ]);
                                          },
                                          child: Image.asset(
                                            "assets/icons/chatbtn.png",
                                            width: 95,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.CREATE_STAFF,
                                                arguments: [
                                                  controller.tempPayload[index],
                                                  true
                                                ]);
                                          },
                                          child: Image.asset(
                                            edit,
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
                                        )
                                            .box
                                            .rounded
                                            .clip(Clip.antiAlias)
                                            .make(),
                                        5.widthBox,
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text:
                                                      "${snapshot.data!.payload![index].name}",
                                                  fontSize: 12.sp,
                                                  color: blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                5.heightBox,
                                                snapshot.data!.payload![index]
                                                            .practice !=
                                                        null
                                                    ? CustomText(
                                                        text:
                                                            "${snapshot.data!.payload![index].practice!.name}",
                                                        fontSize: 11.sp,
                                                        color: blackcolor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )
                                                    : const SizedBox.shrink(),
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
                                                      color: textfieldgrey,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ],
                                                ),
                                                5.heightBox,
                                              ],
                                            ))
                                      ],
                                    ),
                                    10.heightBox,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                              AlertDialog(
                                                title: const Text(
                                                  'Confirm Deletion',
                                                  style: TextStyle(
                                                      color: blackcolor),
                                                ),
                                                content: const Text(
                                                    'Are you sure you want to delete this Staff Member?',
                                                    style: TextStyle(
                                                        color: blackcolor)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Get.back(),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      controller
                                                          .deleteStaffMember(
                                                              snapshot
                                                                  .data!
                                                                  .payload![
                                                                      index]
                                                                  .id!);
                                                      Get.back();
                                                    },
                                                    child: const Text('Delete',
                                                        style: TextStyle(
                                                            color: redColor)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            delete,
                                            width: 95,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.MESSAGES,
                                                arguments: [
                                                  snapshot
                                                      .data!.payload![index].id
                                                      .toString(),
                                                  snapshot.data!.payload![index]
                                                      .name,
                                                ]);
                                          },
                                          child: Image.asset(
                                            "assets/icons/chatbtn.png",
                                            width: 95,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.CREATE_STAFF,
                                                arguments: [
                                                  snapshot
                                                      .data!.payload![index],
                                                  true
                                                ]);
                                            print(
                                                snapshot.data!.payload![index]);
                                          },
                                          child: Image.asset(
                                            edit,
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
                );
              }
            })
      ],
    ));
  }
}
