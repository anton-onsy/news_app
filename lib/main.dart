import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_card_explored.dart';
import 'package:newsapp/features/article_screen/view/article_view.dart';
import 'package:newsapp/features/explore_screen/view/explored_view.dart';
import 'package:newsapp/features/home_screen/view/Search_view.dart';
import 'package:newsapp/features/home_screen/view/home_view.dart';
import 'package:newsapp/features/home_screen/view/welcome_view.dart';
import 'package:newsapp/features/settings_screen/view/settings_view.dart';
import 'package:newsapp/features/splash_screen/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Appcolors.button_text_color,
          fontFamily: 'Schibsted Grotesk',
        ),
        home: SplashView(),
      ),
    );
  }
}

