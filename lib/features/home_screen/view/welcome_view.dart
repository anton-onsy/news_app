import 'package:flutter/material.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/features/home_screen/view/Search_view.dart';
import 'package:newsapp/features/home_screen/widgets/custom_stack_overlay.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.button_background_color,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: AlignmentGeometry.center,
              colors: [
              Appcolors.button_background_color,
              Appcolors.splash_background_color
            ],)
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomStackOverlay(onPressed: () {
              Goto(context, SearchView());
            }),
          ),
        ),
      ),

    );
  }
}