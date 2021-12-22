
import 'package:test_ui/design/images/images.dart';

class EnabledModel {
  String img;
  String headerText;
  String description;
  String buttonText;
 
  EnabledModel({
    required this.img,
    required this.headerText,
    required this.description,
    required this.buttonText,
  });
}

List<EnabledModel> screens = <EnabledModel>[
  EnabledModel(
    img: MyImages.imgNotification,
    headerText: 'Don’t miss out',
    description: 'See all newest deals for you, before they expire.',
    buttonText: 'Enable Push Notìication',
  ),
  EnabledModel(
    img: MyImages.imgLocation,
    headerText: 'Add you location',
    description: 'Be the first to know about all newest deals around you.',
    buttonText: 'Enable Location',
  ),
  EnabledModel(
    img: MyImages.imgShopping,
    headerText: 'Welcome to Kyda',
    description: 'Do enjoy and find everything you want.',
    buttonText: 'Let get started',
  ),
];
