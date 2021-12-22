import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class FogotPasswordSuccessScreen extends StatelessWidget {
  const FogotPasswordSuccessScreen({Key? key}) : super(key: key);

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
                  children: [
                    SizedBox(
                      height: 130.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: const Image(
                            image: AssetImage(MyImages.resetPassword),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Text(
                          'Reset password',
                          style: MyTextStyles.headerText(
                              MyColors.defaultHeaderTextColor),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Enter your username or email address and we will send you a code to reset your password',
                          textAlign: TextAlign.center,
                          style: MyTextStyles.descriptionStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 128.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyButtonWidget(
                            text: 'Back to login',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MainNavigationRoutesNames.login);
                            },
                          ),
                        ),
                      ],
                    ),
                    /*  Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.red[200],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.red[100], shape: BoxShape.circle),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red[50], shape: BoxShape.circle),
                    ),
                  ],
                ), */
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
