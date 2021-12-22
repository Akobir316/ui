import 'package:flutter/material.dart';
import 'package:test_ui/design/screens/auth/fogot_password/fogot_password.dart';
import 'package:test_ui/design/screens/auth/fogot_password/fogot_password_code.dart';
import 'package:test_ui/design/screens/auth/fogot_password/fogot_password_reset.dart';
import 'package:test_ui/design/screens/auth/fogot_password/fogot_password_success.dart';
import 'package:test_ui/design/screens/auth/login.dart';
import 'package:test_ui/design/screens/auth/onboarding.dart';
import 'package:test_ui/design/screens/auth/other/notification.dart';
import 'package:test_ui/design/screens/auth/register/about_you_favorites.dart';
import 'package:test_ui/design/screens/auth/register/about_you_name.dart';
import 'package:test_ui/design/screens/auth/register/create_account.dart';
import 'package:test_ui/design/screens/auth/register/enabled.dart';
import 'package:test_ui/design/screens/auth/register/verify_code.dart';
import 'package:test_ui/design/screens/auth/register/verify_phone_number.dart';
import 'package:test_ui/design/screens/home/api_example.dart';
import 'package:test_ui/design/screens/home/index.dart';

abstract class MainNavigationRoutesNames {
  static const String splash = 'splash';
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String fogotPasswordEmail = 'fogot_password_email';
  static const String fogotPasswordCode = 'fogot_password_code';
  static const String fogotPasswordReset = 'fogot_password_reset';
  static const String fogotPasswordSuccess = 'fogot_password_succes';
  static const String verifyPhoneNumber = 'verify_phone_number';
  static const String verifyCode = 'verify_code';
  static const String createAccount = 'create_account';
  static const String aboutName = 'about_name';
  static const String aboutFavorite = 'about_favorite';
  static const String enabled = 'enabled';
  static const String notification = 'notification';
  static const String homePage = 'home';
  static const String api = 'api';
}

class MainNavigation {
  String initialRoute = MainNavigationRoutesNames.welcome;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.welcome: (context) => const OnBoardingScreen(),
    MainNavigationRoutesNames.login: (context) => const LoginScreen(),
    MainNavigationRoutesNames.fogotPasswordEmail: (context) =>
        const FogotPasswordScreen(),
    MainNavigationRoutesNames.fogotPasswordCode: (context) =>
        const FogotPasswordCodeScreen(),
    MainNavigationRoutesNames.fogotPasswordReset: (context) =>
        const FogotPasswordResetScreen(),
    MainNavigationRoutesNames.fogotPasswordSuccess: (context) =>
        const FogotPasswordSuccessScreen(),
    MainNavigationRoutesNames.api: (context) => const ApiDataViewScreen(),
    MainNavigationRoutesNames.verifyPhoneNumber: (context) =>
        const VerifyPhoneNumber(),
    MainNavigationRoutesNames.verifyCode: (context) => VeriyfyCodeScreen(),
    MainNavigationRoutesNames.createAccount: (context) =>
        const CreateAccountScreen(),
    MainNavigationRoutesNames.aboutName: (context) =>
        const AboutYouNameScreen(),
    MainNavigationRoutesNames.aboutFavorite: (context) =>
        const AboutYouFavoriteScreen(),
    MainNavigationRoutesNames.enabled: (context) => const EnabledScreen(),
    MainNavigationRoutesNames.homePage: (context) => const IndexHomePage(),
    MainNavigationRoutesNames.notification: (context) =>
        const NotificationScreen(),
  };
}
