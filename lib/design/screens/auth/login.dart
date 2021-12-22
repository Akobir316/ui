import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/icons/icons.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';
import 'package:test_ui/design/widgets/password._textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: MyStyles.appPadding,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: MyTextStyles.headerText(
                              MyColors.defaultHeaderTextColor),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Text('Nat a member yet?',
                                style: MyTextStyles.descriptionStyle),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context,
                                    MainNavigationRoutesNames
                                        .verifyPhoneNumber);
                              },
                              child: Text(
                                'Register now',
                                style: MyTextStyles.textButtonStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 54.h,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              text: 'Login',
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, MainNavigationRoutesNames.api);
                                Navigator.pushNamed(context,
                                    MainNavigationRoutesNames.homePage);
                              },
                            )),
                            SizedBox(
                              width: 24.w,
                            ),
                            Container(
                              width: 48.h,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFCED4DA)),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: IconButton(
                                iconSize: 32.sp,
                                icon: SvgPicture.asset(MyIcons.faceId),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  MainNavigationRoutesNames.fogotPasswordEmail);
                            },
                            child: Text(
                              'Fogot your password',
                              style: MyTextStyles.helperTextStyle(
                                  const Color(0xFF2E97BA)),
                            ),
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
