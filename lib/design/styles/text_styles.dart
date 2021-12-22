import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/design/styles/colors.dart';

abstract class MyTextStyles {
  static headerText(Color color) {
    return TextStyle(
        fontSize: 24.sp, fontWeight: FontWeight.w600, color: color);
  }

  static final headerTextStyle1 = TextStyle(
      color: MyColors.defaultHeaderTextColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600);
  static final descriptionStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF495057));
  static final descriptionStyleHome = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: MyColors.defaultHeaderTextColor);
  static final textButtonStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF2E97BA));
  static final labelTextStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF495057));
  static final inputTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF212529));
  static helperTextStyle(Color color) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );
  static final nickNameTextStyle = TextStyle(
      fontSize: 14.sp,
      color: MyColors.defaultHeaderTextColor,
      fontWeight: FontWeight.w600);
  static final productTitleTextStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: MyColors.defaultHeaderTextColor);
  static final productPriseTextStyle = TextStyle(
      color: const Color(0xFFD0906D),
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);
  static final notificationTextStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: MyColors.defaultHeaderTextColor);
  static final categoryLabelTextStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: MyColors.defaultHeaderTextColor);
}
