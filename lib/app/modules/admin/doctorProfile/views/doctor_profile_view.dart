import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/app/data/getModels/doctor/getAllDoctorsModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/colors.dart';
import 'package:patient_management/app/resources/paddings.dart';
import 'package:patient_management/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/doctor_profile_controller.dart';

class DoctorProfileView extends GetView<DoctorProfileController> {
  const DoctorProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    Payload payload = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(payload.name!),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.network(
                "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                isAntiAlias: true,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
                  .box
                  .clip(Clip.antiAlias)
                  .width(150)
                  .height(150)
                  .border(color: primarycolor, width: 5)
                  .rounded
                  .make(),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: crosstart,
              children: [
                10.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Username:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.userName!,
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Email:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.email!,
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Practice:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.practice!.name!,
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Fax:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.fax!,
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Phone:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.phone!,
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Date:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.date!.toString().split(' ')[0],
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: mainbetween,
                  children: [
                    CustomText(
                        text: "Password:",
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.normal),
                    CustomText(
                        text: payload.originalPassword!,
                        fontSize: 16.sp,
                        color: whitecolor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                50.heightBox,
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.CHANGE_PASSWORD,
                          arguments: payload.id);
                    },
                    child: Image.asset("assets/icons/changepassword.png"))
              ],
            )
                .box
                .color(primarycolor)
                .topRounded(value: 30)
                .padding(pad20)
                .width(double.infinity)
                .make()
          ],
        ));
  }
}
