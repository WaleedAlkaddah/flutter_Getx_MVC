import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SnackBarWidget {
  static void showCustomSnackBar(String message, String title) {
    Get.snackbar(
      title,
      message,
      titleText: SizedBox(
        height: 15.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF848484),
              ),
            ),
            15.0.horizontalSpace
          ],
        ),
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 15.h,
            child: Text(
              message,
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF848484),
              ),
            ),
          ),
          15.0.horizontalSpace
        ],
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 50),
      backgroundColor: Colors.white,
      colorText: const Color(0xFF848484),
      duration: const Duration(seconds: 6),
    );
  }
}
