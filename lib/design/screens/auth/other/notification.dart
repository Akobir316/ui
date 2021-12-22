import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/icons/icons.dart';
import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/screens/home/api_example.dart';
import 'package:test_ui/design/screens/home/categories.dart';
import 'package:test_ui/design/screens/home/home.dart';
import 'package:test_ui/design/screens/home/messages.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? currentTab;
    RouteSettings route = ModalRoute.of(context)!.settings;
    currentTab = route.arguments as int;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 12.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
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
            padding:
                EdgeInsets.only(top: 14.h, left: 8.w, right: 8.w, bottom: 8.h),
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
            padding:
                EdgeInsets.only(top: 14.h, left: 8.w, right: 8.w, bottom: 8.h),
            onPressed: () {},
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
      body: const _BodyWidget(),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButton: SizedBox(
        width: 64.w,
        height: 64.w,
        child: FloatingActionButton(
          onPressed: () {},
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
                      Navigator.pushReplacementNamed(
                          context, MainNavigationRoutesNames.homePage,
                          arguments: HomeScreen());
                    },
                    icon: SvgPicture.asset(
                      currentTab == 0 ? MyIcons.homeSelect : MyIcons.icHome,
                    )),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, MainNavigationRoutesNames.homePage,
                        arguments: const CategoriesScreen());
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
                    Navigator.pushReplacementNamed(
                        context, MainNavigationRoutesNames.homePage,
                        arguments: const MessagesScreen());
                  },
                  icon: SvgPicture.asset(
                    currentTab == 2
                        ? MyIcons.messageSelect
                        : MyIcons.icMessages,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, MainNavigationRoutesNames.homePage,
                        arguments: const ApiDataViewScreen());
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

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  __BodyWidgetState createState() => __BodyWidgetState();
}

class __BodyWidgetState extends State<_BodyWidget> {
  final items = List<String>.generate(15, (i) => '${i + 1}');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, left: 24.w, right: 24.w),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 24.w,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: ValueKey(item),
            onDismissed: (direction) {
              items.removeAt(index);
              setState(() {});
            },
            direction: DismissDirection.endToStart,
            background: Container(
              width: 64.w,
              height: 64.w,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 22.h),
              child: SvgPicture.asset(
                MyIcons.icDelete,
                fit: BoxFit.cover,
                width: 24.w,
                height: 24.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: const Color(0xFFFFE3D3),
              ),
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: 64.w,
                      height: 64.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          MyImages.imgItem,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                        image: const DecorationImage(
                            image: AssetImage(MyImages.imgAva),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jeffrey has sent you a message for product “Flower Vase Farmhouse message fpr price”',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyles.notificationTextStyle,
                      ),
                      SizedBox(height: 8.h),
                      const Text('1 days ago'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
