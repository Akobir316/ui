import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';
import 'package:test_ui/design/widgets/password._textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  
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
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Create an account',
                      style: MyTextStyles.headerText(
                          MyColors.defaultHeaderTextColor),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Username',
                      style: MyTextStyles.labelTextStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      style: MyTextStyles.inputTextStyle,
                      keyboardType: TextInputType.emailAddress,
                      decoration: MyStyles.textFieldDecoration,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Password',
                      style: MyTextStyles.labelTextStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const PasswordTextField(),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        Expanded(
                            child: MyButtonWidget(
                          text: 'Register',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MainNavigationRoutesNames.aboutName);
                          },
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'By click Create an Account, you agreed with Kyda',
                                style: MyTextStyles.helperTextStyle(
                                    const Color(0xFF6C757D)),
                              ),
                              TextSpan(
                                  text: ' Team of user ',
                                  style: MyTextStyles.helperTextStyle(
                                      const Color(0xFF2E97BA)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                text: ' and ',
                                style: MyTextStyles.helperTextStyle(
                                    const Color(0xFF6C757D)),
                              ),
                              TextSpan(
                                  text: ' Privacy Policy ',
                                  style: MyTextStyles.helperTextStyle(
                                      const Color(0xFF2E97BA)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
