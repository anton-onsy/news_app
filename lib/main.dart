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

  @override
  Widget build(BuildContext context) {
    bool isLoading = false; // Simulate loading state
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Appcolors.button_text_color,
          fontFamily: 'Schibsted Grotesk',
        ),
        home:  ArticleView(
                    title: "How all the 2025 iPhone models compare on paper",
                    author: "Brandon Russell",
                    publishedAt: "2025-09-10T14:29:04Z",
                    content: """The new iPhone Air is Apple’s thinnest iPhone ever. | Image: The Verge At its latest hardware event on Tuesday, Apple officially announced the new 2025 iPhone lineup. That includes the iPhone 17, iPhone 17 Pro, iPhone 17 Pro Max, and the slimmed-down iPhone Air, which looks to be the standout model this year. The devices come equipped with Apple’s latest A19 processors and a few other notable upgrades. For instance, the standard iPhone 17 now features a larger 6.3-inch ProMotion display, a more advanced selfie cam, and double the base storage.Of course, the iPhone Air is arguably the main attraction this year, featuring a design that’s just 5.6mm thick. That makes it the thinnest iPhone ever made. It boasts a …""",
                    image: "https://platform.theverge.com/wp-content/uploads/sites/2/2025/09/DSC01460.jpg?quality=90&strip=all&crop=0,0,100,100",
                   onPressed: () {},
                 ),
      ),
    );
  }
}

