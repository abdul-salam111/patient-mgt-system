import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/data/getModels/doctor/loginResponseModel.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/resources/storageServices.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: pad16,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: mainstart,
                crossAxisAlignment: crosstart,
                children: [
                  30.heightBox,
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: whitecolor,
                      )),
                  20.heightBox,
                  CustomText(
                      text: "Profile",
                      fontSize: 20.sp,
                      color: whitecolor,
                      fontWeight: FontWeight.w500),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: mainstart,
                    children: [
                      CircleAvatar(
                        radius: 35.r,
                        backgroundImage: const NetworkImage(
                            "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          CustomText(
                              text: signInResponseModelFromJson(
                                      sharedPrefbox.read(userInformation))
                                  .payload!
                                  .user!
                                  .name!,
                              fontSize: 20.sp,
                              color: whitecolor,
                              fontWeight: FontWeight.w600),
                          5.heightBox,
                          CustomText(
                              text: signInResponseModelFromJson(
                                      sharedPrefbox.read(userInformation))
                                  .payload!
                                  .user!
                                  .email!,
                              fontSize: 12.sp,
                              color: whitecolor,
                              fontWeight: FontWeight.w500),
                          5.heightBox,
                          CustomText(
                              text: signInResponseModelFromJson(
                                      sharedPrefbox.read(userInformation))
                                  .payload!
                                  .user!
                                  .phone!,
                              fontSize: 12.sp,
                              color: whitecolor,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
            .box
            .height(200.h)
            .color(primarycolor)
            .width(double.infinity)
            .bottomRounded(value: 30)
            .make(),
        const Spacer(),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    sharedPrefbox.remove(userToken);
                    Get.offAllNamed(Routes.SIGNIN);
                  },
                  child: Image.asset("assets/images/logout.png"))
            ],
          ),
        ),
        30.heightBox,
      ],
    ));
  }
}
