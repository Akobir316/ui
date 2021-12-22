import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_ui/app/navigation/main_navigation.dart';

import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class AboutYouFavoriteScreen extends StatelessWidget {
  const AboutYouFavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: MyStyles.appPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Text(
              'What\'s your favorites',
              style: MyTextStyles.headerText(MyColors.defaultHeaderTextColor),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
                'Let us know your favorites category then we gonna send you notification when have hot deals for you.',
                style: MyTextStyles.descriptionStyle),
            SizedBox(
              height: 24.h,
            ),
            _Favorites(),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                    child: MyButtonWidget(
                  text: 'Done',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, MainNavigationRoutesNames.enabled);
                  },
                )),
              ],
            ),
            SizedBox(
              height: 56.h,
            )
          ],
        ),
      )),
    );
  }
}

class _Favorites extends StatefulWidget {
  const _Favorites({Key? key}) : super(key: key);

  @override
  __FavoritesState createState() => __FavoritesState();
}

class __FavoritesState extends State<_Favorites> {
  List isSelect = [];

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.only(top: 24.h, left: 12.w, right: 12.w, bottom: 12.h),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: appWidth > 450 ? 4 : 3,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: appWidth > 450 ? 20 : 32.h,
              childAspectRatio: appWidth > 450 ? 0.68 : 80 / 104),
          itemBuilder: (context, index) => Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  if (isSelect.contains(index)) {
                    isSelect.remove(index);
                  } else {
                    isSelect.add(index);
                  }
              
                  setState(() {});
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        MyImages.yourFavorite,
                        width: 80.w,
                        height: 80.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    (isSelect.contains(index))
                        ? Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                              color: MyColors.defaultHeaderTextColor
                                  .withOpacity(0.5),
                              border: Border.all(
                                  color: const Color(0xFFFDC086), width: 2.0),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: const Icon(
                              Icons.check_circle,
                              color: Color(0xFFFDC086),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Favorite',
                style: MyTextStyles.labelTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
