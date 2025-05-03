import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:patient_management/app/resources/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  Color? color;
  final VoidCallback onPressed;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = primarycolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: color, // Adjust the color as needed
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0, // Adjust the font size as needed
              fontWeight: FontWeight.w500, // Adjust the font weight as needed
            ),
          ),
        ),
      ),
    );
  }
}
