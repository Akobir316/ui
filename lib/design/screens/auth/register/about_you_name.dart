import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:test_ui/app/navigation/main_navigation.dart';

import 'package:test_ui/design/images/images.dart';
import 'package:test_ui/design/screens/home/home.dart';
import 'package:test_ui/design/screens/home/index.dart';

import 'package:test_ui/design/styles/colors.dart';
import 'package:test_ui/design/styles/styles.dart';
import 'package:test_ui/design/styles/text_styles.dart';
import 'package:test_ui/design/widgets/buttons.dart';

class AboutYouNameScreen extends StatefulWidget {
  const AboutYouNameScreen({Key? key}) : super(key: key);

  @override
  State<AboutYouNameScreen> createState() => _AboutYouNameScreenState();
}

class _AboutYouNameScreenState extends State<AboutYouNameScreen> {
  File? image;
  Future getImage() async {
    try {
      final image = await ImagePicker().pickVideo(
          source: ImageSource.camera, maxDuration: Duration(seconds: 15));
      if (image == null) return;
      final imageFile = File(image.path);
      setState(() {
        this.image = imageFile;
        IndexHomePage.imageAva = imageFile;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:{$e}');
    }
  }

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
                      'About you',
                      style: MyTextStyles.headerText(
                          MyColors.defaultHeaderTextColor),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('Let us know how to properly address you',
                        style: MyTextStyles.descriptionStyle),
                    SizedBox(
                      height: 32.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 96.w,
                        height: 96.w,
                        child: Stack(
                          children: [
                            image != null
                                ? ClipRRect(
                                    child: Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                      width: 96.w,
                                      height: 96.w,
                                    ),
                                    borderRadius: BorderRadius.circular(16.r),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      MyImages.avatar,
                                      fit: BoxFit.cover,
                                      width: 96.w,
                                      height: 96.w,
                                    ),
                                  ),
                            InkWell(
                              onTap: getImage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'First name',
                      style: MyTextStyles.labelTextStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      style: MyTextStyles.inputTextStyle,
                      keyboardType: TextInputType.name,
                      decoration: MyStyles.textFieldDecoration,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Last name',
                      style: MyTextStyles.labelTextStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      style: MyTextStyles.inputTextStyle,
                      keyboardType: TextInputType.name,
                      decoration: MyStyles.textFieldDecoration,
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        Expanded(
                            child: MyButtonWidget(
                          text: 'Continue',
                          onPressed: () {
                            Navigator.pushNamed(context,
                                MainNavigationRoutesNames.aboutFavorite);
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
