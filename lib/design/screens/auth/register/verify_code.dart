import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class VeriyfyCodeScreen extends StatelessWidget {
  VeriyfyCodeScreen({Key? key}) : super(key: key);
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    List<String> arguments;
    arguments = settings.arguments as List<String>;
    phoneNumber = arguments.join();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: MyStyles.appPadding,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Verify Phone Number',
                      style: MyTextStyles.headerText(
                          MyColors.defaultHeaderTextColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                        'Enter the 4 digit code sent to you phone ${phoneNumber}',
                        style: MyTextStyles.descriptionStyle),
                    SizedBox(
                      height: 48.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w),
                      child: const _DigitCode(),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Doesn\'t recive please click to',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6C757D)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'recend code',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue[300]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyButtonWidget(
                          text: 'Done',
                          onPressed: () {
                            Navigator.pushNamed(context,
                                MainNavigationRoutesNames.createAccount);
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DigitCode extends StatefulWidget {
  const _DigitCode({Key? key}) : super(key: key);

  @override
  __DigitCodeState createState() => __DigitCodeState();
}

class __DigitCodeState extends State<_DigitCode> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: MyTextStyles.inputTextStyle,
      appContext: context,
      autoFocus: true,
      length: 4,
      enableActiveFill: true,
      showCursor: true,
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 0),
      blinkDuration: const Duration(milliseconds: 0),
      onChanged: (value) {},
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8.h),
        fieldHeight: 42.w,
        fieldWidth: 42.w,
        activeFillColor: const Color(0xFFF8F9FA),
        activeColor: const Color(0xFFDEE2E6),
        inactiveColor: const Color(0xFFDEE2E6),
        inactiveFillColor: const Color(0xFFF8F9FA),
        selectedFillColor: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.r),
        shape: PinCodeFieldShape.box,
      ),
    );
  }
}
