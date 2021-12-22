import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_ui/app/models/enabled_model.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class EnabledScreen extends StatefulWidget {
  const EnabledScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<EnabledScreen> {
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

/*   _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('onBoard', isViewed);
    
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 2
          ? null
          : AppBar(
              actions: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, MainNavigationRoutesNames.homePage);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.defaultHeaderTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20.w),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFFE9ECEF),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currentIndex == 2
                  ? SizedBox(
                      height: 190.h,
                    )
                  : SizedBox(
                      height: 10.h,
                    ),
              Image.asset(screens[index].img),
              SizedBox(height: 24.h),
              Text(
                screens[index].headerText,
                style: MyTextStyles.headerText(MyColors.redHeaderTextColor),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(
                  screens[index].description,
                  style: MyTextStyles.descriptionStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: MyButtonWidget(
                      text: screens[index].buttonText,
                      onPressed: () {
                        if (index == 2) {
                          Navigator.pushNamed(
                              context, MainNavigationRoutesNames.homePage);
                        }
                        _pageController.nextPage(
                            duration: Duration(microseconds: 300),
                            curve: Curves.bounceIn);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                ],
              ),
              SizedBox(
                height: 56.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
