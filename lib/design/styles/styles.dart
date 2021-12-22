import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class MyStyles {
  static final appPadding = EdgeInsets.symmetric(horizontal: 24.0.w);
  static final textFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.only(left: 16.0.w, top: 14.h, bottom: 14.h),
    filled: true,
    fillColor: const Color(0xFFF8F9FA),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.r),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFDEE2E6), width: 1.0.w),
      borderRadius: BorderRadius.all(
        Radius.circular(12.r),
      ),
    ),
  );
}
