import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_ui/app/models/onboard_model.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: 133.h, right: 24.w, bottom: 20.h, left: 24.w),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                height: 324.h,
                width: 295.w,
                child: Image.asset(screens[index].img),
              ),
              SizedBox(height: 24.h),
              Text(
                screens[index].headerText,
                style: MyTextStyles.headerText(MyColors.redHeaderTextColor),
              ),
              SizedBox(height: 8.h),
              Text(
                screens[index].description,
                style: MyTextStyles.descriptionStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 48.h,
              ),
              SizedBox(
                height: 10.h,
                child: ListView.builder(
                  itemCount: screens.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 14.0.w),
                        width: currentIndex == index ? 46.0.w : 8.0.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: MyColors.redHeaderTextColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 91.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: MyButtonWidget(
                      text: 'Register',
                      textColor: const Color(0xFF495057),
                      backgroundColor: const Color(0xFFE9ECEF),
                      onPressed: () async {
                        await _storeOnBoardInfo();
                        Navigator.pushNamed(context,
                            MainNavigationRoutesNames.verifyPhoneNumber);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: MyButtonWidget(
                      text: 'Login',
                      onPressed: () async {
                        await _storeOnBoardInfo();
                        Navigator.pushNamed(
                            context, MainNavigationRoutesNames.login);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
