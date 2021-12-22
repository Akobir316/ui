import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/design/styles/text_styles.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: MyTextStyles.inputTextStyle,
      obscureText: _isObscure,
      decoration: InputDecoration(
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
        suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }),
      ),
    );
  }
}
