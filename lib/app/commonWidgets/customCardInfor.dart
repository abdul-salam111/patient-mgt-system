import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/alignments.dart';
import 'package:patient_management/app/resources/paddings.dart';

class CustomInfoCard extends StatelessWidget {
  final Color backgroundColor;
  final String headerText;
  final String bodyText;
  final String imageUrl;

  const CustomInfoCard({
    super.key,
    required this.backgroundColor,
    required this.headerText,
    required this.bodyText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      padding: pad10,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 50,
            height: 50,
          ),
          SizedBox(width: 8.sp),
          Column(
            crossAxisAlignment: crosstart,
            children: [
              CustomText(
                text: headerText,
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: bodyText,
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
