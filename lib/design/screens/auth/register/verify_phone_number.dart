import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({Key? key}) : super(key: key);

  @override
  _VerifyPhoneNumberState createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  final textController = TextEditingController();
  late String countryPhoneCode;
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: MyStyles.appPadding,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'Enter your phone number',
                      style: MyTextStyles.headerText(
                          MyColors.defaultHeaderTextColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'By continuing you may receive an SMS for verification. Message and data rates may apply',
                      style: MyTextStyles.descriptionStyle,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Phone number',
                      style: MyTextStyles.labelTextStyle,
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      controller: textController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: const Color(0xFFF8F9FA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFFDEE2E6), width: 1.0.w),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                        ),
                        errorText: errorText,
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                        ),
                        prefix: CountryCodePicker(
                          onInit: (countryCode) {
                            countryPhoneCode = countryCode!.dialCode.toString();
                          },
                          onChanged: (CountryCode countryCode) {
                            countryPhoneCode = countryCode.dialCode.toString();
                          },
                          searchDecoration: InputDecoration(
                            hintText: 'Search',
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: const Color(0xFFF8F9FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xFFDEE2E6), width: 1.0.w),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(bottom: 16.h),
                          favorite: const ['UZ'],
                          initialSelection: 'UZ',
                          flagWidth: 40.w,
                          flagDecoration:
                              const BoxDecoration(shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MyButtonWidget(
                            text: 'Cancel',
                            textColor: const Color(0xFF495057),
                            backgroundColor: const Color(0xFFE9ECEF),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: MyButtonWidget(
                            text: 'Next',
                            onPressed: () {
                              if (textController.text.isNotEmpty) {
                                errorText = null;
                                Navigator.pushNamed(
                                  context,
                                  MainNavigationRoutesNames.verifyCode,
                                  arguments: [
                                    countryPhoneCode,
                                    textController.text
                                  ],
                                );
                                setState(() {});
                              } else {
                                errorText = 'Заполните поле!';
                                setState(() {});
                              }
                            },
                          ),
                        ),
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
