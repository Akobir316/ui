import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_ui/app/models/ava_img_model.dart';
import 'package:test_ui/app/navigation/main_navigation.dart';
import 'package:test_ui/design/styles/colors.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MainNavigation mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UI',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(color: MyColors.defaultHeaderTextColor),
            iconTheme: IconThemeData(
              color: MyColors
                  .defaultHeaderTextColor, // установка цвета для иконок AppBar - чёрный
            ),
          ),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routes: mainNavigation.routes,
        initialRoute: isviewed != 0
            ? mainNavigation.initialRoute
            : MainNavigationRoutesNames.login,
      ),
    );
  }
}
