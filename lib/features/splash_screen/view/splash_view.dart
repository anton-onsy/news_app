import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/features/home_screen/view/welcome_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Goto(context, WelcomeView());
    });
    return Scaffold(
      backgroundColor: Appcolors.splash_background_color,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Khab",
                style: TextStyle(
                  color: Appcolors.button_background_color,
                  fontSize:48.sp,
                  fontWeight: FontWeight.w700,
                  ),
                  ),
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding:  EdgeInsets.only(top:7),
                  child: SvgPicture.asset(
                    Appassets.Splash_icon,
                    fit: BoxFit.cover,
                  ),
                ),
                Text("r",
                style: TextStyle(
                  color: Appcolors.button_background_color,
                  fontSize:48.sp,
                  fontWeight: FontWeight.w700,
                  ),
                  ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}