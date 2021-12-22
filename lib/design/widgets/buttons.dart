import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButtonWidget extends StatelessWidget {
  MyButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFF2625A),
    this.textColor = const Color(0xFFFFFFFF),
  }) : super(key: key);
  final String text;
  Color backgroundColor;
  Color textColor;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 12.w,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
