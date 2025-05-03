import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/colors.dart';

AppBar customAppBar({required String title, required bool center}) {
  return AppBar(
    leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios)),
    automaticallyImplyLeading: true,
    iconTheme: const IconThemeData(color: blackcolor),
    title: CustomText(
      text: title,
      color: blackcolor,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: center,
  );
}
