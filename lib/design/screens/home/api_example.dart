import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ui/app/http/api_client.dart';
import 'package:test_ui/design/icons/icons.dart';
import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/text_styles.dart';

class ApiDataViewScreen extends StatefulWidget {
  const ApiDataViewScreen({Key? key}) : super(key: key);

  @override
  State<ApiDataViewScreen> createState() => _ApiDataViewScreenState();
}

class _ApiDataViewScreenState extends State<ApiDataViewScreen> {
  Color fillColor = Color(0xFFF8F9FA);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
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
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    padding: EdgeInsets.all(10.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFE3D3),
                    ),
                    child: SvgPicture.asset(
                      MyIcons.icFilter,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 44.h,
              ),
              Text(
                'Result for Todos',
                style: MyTextStyles.headerTextStyle1,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text('200 item', style: MyTextStyles.descriptionStyleHome),
              SizedBox(
                height: 18.h,
              ),
              const _Content(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  final String? query;
  const _Content({
    Key? key,
    this.query,
  }) : super(key: key);

  @override
  __ContentState createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  ApiClient api = ApiClient();
  Future<List<dynamic>>? todos;

  @override
  void initState() {
    super.initState();
    todos = api.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appheight = MediaQuery.of(context).size.height;

    return FutureBuilder<List<dynamic>>(
      future: todos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: appWidth > 450 ? 3 : 2,
                  crossAxisSpacing: appWidth > 450 ? 16 : 18.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: appWidth > 450
                      ? 145 / 340
                      : (((145 / 375) * appWidth) / ((323 / 852) * appheight)),
                ),
                itemCount: snapshot.data!.length,
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
                            image: AssetImage(MyImages.apiImg),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Title:${snapshot.data![index].title}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: MyTextStyles.productTitleTextStyle,
                              ),
                              SizedBox(height: 8.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'UserId:${snapshot.data![index].userId}',
                                    style: MyTextStyles.productPriseTextStyle,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Id:${snapshot.data![index].id}',
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
                              /* const SizedBox(
                                height: 10,
                              ), */
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
/* */
  