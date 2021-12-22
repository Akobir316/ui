import 'package:test_ui/design/images/images.dart';

class OnboardModel {
  String img;
  String headerText;
  String description;
  OnboardModel({
    required this.img,
    required this.headerText,
    required this.description,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
      img: MyImages.imgOnboarding1,
      headerText: 'Welcome to Kyda',
      description: 'Help you trade second-hand products goods conveniently'),
  OnboardModel(
      img: MyImages.imgOnboarding2,
      headerText: 'Selling',
      description:
          'Just one click then your products will be on sell list right away'),
  OnboardModel(
      img: MyImages.imgOnboarding3,
      headerText: 'Buying',
      description:
          'No more worrying about finding quality goods with cheaper price.'),
];
