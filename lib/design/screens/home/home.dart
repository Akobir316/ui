import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ui/design/icons/icons.dart';
import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(left: 24.w, top: 30.h, right: 24.w),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                gapPadding: 0,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  gapPadding: 0,
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                gapPadding: 0,
                borderSide:
                    const BorderSide(color: Color(0xFFFDC086), width: 1.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 14.h),
              fillColor: const Color(0xFFFFF0DB),
              filled: true,
              prefixIcon: const Icon(
                Icons.search_sharp,
                color: Color(0xFFD0906D),
              ),
              hintText: 'What\'s your favorite?',
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.defaultHeaderTextColor,
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flesh New',
                      style: MyTextStyles.headerTextStyle1,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          '20mil',
                          style: MyTextStyles.descriptionStyleHome,
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Icon(
                          Icons.location_on_sharp,
                          color: const Color(0xFF495057),
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Broklyn, New York',
                          style: MyTextStyles.descriptionStyleHome,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  _isGrid = !_isGrid;
                  setState(() {});
                },
                padding: EdgeInsets.zero,
                color: const Color(0xFFFFE3D3),
                icon: Container(
                  padding: EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFE3D3),
                  ),
                  child: SvgPicture.asset(
                    _isGrid ? MyIcons.list : MyIcons.categorySelect,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          _isGrid ? GridViewScreen() : const ListViewScreen(),
        ],
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: double.infinity,
              height: 216.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                image: const DecorationImage(
                  image: AssetImage(MyImages.imgItem),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      children: [
                        Text(
                          'Beats by Dr. Dre Studio 3 Wireless Over-Ear Noise Cancelling',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: MyTextStyles.productTitleTextStyle,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '\$288.00',
                                style: MyTextStyles.productPriseTextStyle,
                              ),
                            ),
                            Text(
                              '0.5mil',
                              style: MyTextStyles.helperTextStyle(
                                const Color(0xFF495057),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF6EF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    child: Icon(
                      Icons.bookmark_outline,
                      color: Colors.red,
                      size: 24.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE3D3),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appheight = MediaQuery.of(context).size.height;
    return Expanded(
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: appWidth > 450 ? 3 : 2,
          crossAxisSpacing: appWidth > 450 ? 16 : 18.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: appWidth > 450
              ? 145 / 340
              : (((145 / 375) * appWidth) / ((323 / 852) * appheight)),
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF6EF),
              borderRadius: BorderRadius.circular(16.r),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 176.h,
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage(MyImages.imgItem),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Beats by Dr. Dre Studio 3 Wireless Over-Ear Noise Cancelling',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyles.productTitleTextStyle,
                      ),
                      SizedBox(height: 8.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$288.00',
                            style: MyTextStyles.productPriseTextStyle,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '0.5mil',
                                  style: MyTextStyles.helperTextStyle(
                                    const Color(0xFF495057),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.bookmark_outline,
                                color: Colors.red,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
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
