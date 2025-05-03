import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/colors.dart';

Widget customFieldDropDown(
    {required RxString hintttext, required List<String> valuesList}) {
  return Obx(() {
    return Stack(
      children: [
        TextFormField(
          style: const TextStyle(color: textfieldgrey),
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintttext.value,
            hintStyle: const TextStyle(color: textfieldgrey),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: textfieldgrey,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: greyColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: const EdgeInsets.only(left: 10, top: 0),
          ),
        ),
        Positioned(
          right: 20,
          top: 0,
          bottom: 0,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(20),
              dropdownColor: whitecolor,
              icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/icons/dropdown.png",
                    height: 13,
                    width: 13,
                  )),
              items: valuesList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CustomText(
                    color: textfieldgrey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                    text: value,
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  hintttext.value = newValue;
                }
              },
            ),
          ),
        ),
      ],
    );
  });
}
