import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ui/design/icons/icons.dart';
import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Color fillColor = const Color(0xFFF8F9FA);
  int select = -1;
  bool _isGrid = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(left: 24.w, top: 30.h, right: 24.w),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onTap: () {
                        fillColor = Colors.white;
                        setState(() {});
                      },
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
                          borderSide: const BorderSide(
                              color: Color(0xFFFDC086), width: 1.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                        fillColor: fillColor,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search_sharp,
                          color: MyColors.defaultHeaderTextColor,
                        ),
                        focusColor: Colors.white,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFADB5BD),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Categories',
                          style: MyTextStyles.nickNameTextStyle,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Browse more'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 130.w,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(16.r),
                                  onTap: () {
                                    select = index;
                                    setState(() {});
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.asset(
                                          MyImages.yourFavorite,
                                          width: 96.w,
                                          height: 96.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 96.w,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.h),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Cosmetic',
                                          style: MyTextStyles
                                              .categoryLabelTextStyle,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(14.r),
                                            bottomRight: Radius.circular(14.r),
                                          ),
                                          color: const Color(0xFFFFE3D3)
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                      select == index
                                          ? Container(
                                              width: 96.w,
                                              height: 96.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: MyColors
                                                        .appColorTheme.shade400,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                select == index
                                    ? Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: MyColors
                                                .appColorTheme.shade400),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 16,
                              ),
                          itemCount: 16),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            collapsedHeight: 80.h,
            pinned: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cosmetic',
                  style: MyTextStyles.headerTextStyle1,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text('250 item', style: MyTextStyles.descriptionStyleHome),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _isGrid = !_isGrid;
                  setState(() {});
                },
                padding: EdgeInsets.zero,
                color: const Color(0xFFFFE3D3),
                icon: Container(
                  padding: const EdgeInsets.all(12),
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
              ),
            ],
          ),
          _isGrid ? const GridViewScreen() : const ListViewScreen(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              height: 80.h,
            ),
          )
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
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
          );
        },
        childCount: 7,
      ),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appheight = MediaQuery.of(context).size.height;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: appWidth > 450 ? 3 : 2,
        crossAxisSpacing: appWidth > 450 ? 16 : 18.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: appWidth > 450
            ? 145 / 340
            : (((145 / 375) * appWidth) / ((323 / 852) * appheight)),
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
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
        childCount: 7,
      ),
    );
  }
}
