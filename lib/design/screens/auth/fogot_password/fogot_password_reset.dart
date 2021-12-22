import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';
import 'package:test_ui/design/widgets/password._textfield.dart';

class FogotPasswordResetScreen extends StatelessWidget {
  const FogotPasswordResetScreen({Key? key}) : super(key: key);

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
                      'Reset Password',
                      style: MyTextStyles.headerText(
                          MyColors.defaultHeaderTextColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                        'Enter your username or email address and we will send you a code to reset your password',
                        style: MyTextStyles.descriptionStyle),
                    SizedBox(
                      height: 32.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New password',
                          style: MyTextStyles.labelTextStyle,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const PasswordTextField(),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Confirm new password',
                          style: MyTextStyles.labelTextStyle,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const PasswordTextField(),
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyButtonWidget(
                          text: 'Change Password',
                          onPressed: () {
                            Navigator.pushNamed(context,
                                MainNavigationRoutesNames.fogotPasswordSuccess);
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
