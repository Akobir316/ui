import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/icons/icons.dart';
import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/screens/home/home.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';

import 'api_example.dart';
import 'categories.dart';
import 'messages.dart';

class IndexHomePage extends StatefulWidget {
  const IndexHomePage({Key? key}) : super(key: key);
  static File? imageAva;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<IndexHomePage> {
  int currentTab = 0;

  final List<Widget> screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const MessagesScreen(),
    const ApiDataViewScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  late Widget currentScreen;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteSettings routeSettings = ModalRoute.of(context)!.settings;

    if (routeSettings.arguments != null) {
      currentScreen = routeSettings.arguments as Widget;
      switch (routeSettings.arguments.runtimeType) {
        case HomeScreen:
          currentTab = 0;
          break;
        case CategoriesScreen:
          currentTab = 1;
          break;
        case MessagesScreen:
          currentTab = 2;
          break;
        case ApiDataViewScreen:
          currentTab = 3;
          break;
      }
    } else {
      currentScreen = HomeScreen();
    }
  }

  File? image;
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageFile = File(image.path);
      setState(() {
        this.image = imageFile;
        Navigator.pushNamed(
          context,
          MainNavigationRoutesNames.homePage,
          arguments: Center(
            child: Image.file(
              this.image!,
            ),
          ),
        );
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:{$e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentTab == 3
          ? AppBar(
              actions: [
                IconButton(
                  padding: EdgeInsets.only(
                      top: 14.h, left: 8.w, right: 8.w, bottom: 8.h),
                  onPressed: () {},
                  icon: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: SvgPicture.asset(
                      MyIcons.icBag,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                IconButton(
                  padding: EdgeInsets.only(
                      top: 14.h, left: 8.w, right: 8.w, bottom: 8.h),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, MainNavigationRoutesNames.notification,
                        arguments: currentTab);
                  },
                  icon: SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: SvgPicture.asset(
                        MyIcons.icNotificationActive,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 12.w,
                ),
              ],
            )
          : AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.only(left: 12.w, top: 12.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: IndexHomePage.imageAva != null
                          ? Image.file(
                              IndexHomePage.imageAva!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              MyImages.imgAva,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Good morning',
                              style: MyTextStyles.helperTextStyle(
                                  MyColors.defaultHeaderTextColor),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Image.asset(
                              MyImages.icEmoji,
                              width: 16.w,
                              height: 16.w,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Jennifer',
                          style: MyTextStyles.nickNameTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.only(
                      top: 14.h, left: 8.w, right: 8.w, bottom: 8.h),
                  onPressed: () {},
                  icon: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: SvgPicture.asset(
                      MyIcons.icBag,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                IconButton(
                  padding: EdgeInsets.only(
                      top: 14.h, left: 8.w, right: 8.w, bottom: 8.h),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, MainNavigationRoutesNames.notification,
                        arguments: currentTab);
                  },
                  icon: SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: SvgPicture.asset(
                        MyIcons.icNotificationActive,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 12.w,
                ),
              ],
            ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: SizedBox(
        width: 64.w,
        height: 64.w,
        child: FloatingActionButton(
          onPressed: getImage,
          child: Container(
            width: 64.w,
            height: 64.w,
            padding: EdgeInsets.all(20.h),
            child: SvgPicture.asset(MyIcons.icCamera),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color(0xFFFF8585),
                  Color(0xFFF2625A),
                ])),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
        child: BottomAppBar(
          notchMargin: 6,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      currentScreen = HomeScreen();
                      currentTab = 0;
                      setState(() {});
                    },
                    icon: SvgPicture.asset(
                      currentTab == 0 ? MyIcons.homeSelect : MyIcons.icHome,
                    )),
                IconButton(
                  onPressed: () {
                    currentScreen = const CategoriesScreen();
                    currentTab = 1;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    currentTab == 1
                        ? MyIcons.categorySelect
                        : MyIcons.icCategories,
                  ),
                ),
                const SizedBox.shrink(),
                IconButton(
                  onPressed: () {
                    currentScreen = const MessagesScreen();
                    currentTab = 2;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    currentTab == 2
                        ? MyIcons.messageSelect
                        : MyIcons.icMessages,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    currentScreen = const ApiDataViewScreen();
                    currentTab = 3;
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    (currentTab == 3
                        ? MyIcons.accountSelect
                        : MyIcons.icAccount),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
