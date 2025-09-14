import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/helper/navigator_page.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';

class CustomNavigationView extends StatefulWidget {
  const CustomNavigationView({super.key, this.index=0});
  final int index;
  @override
  State<CustomNavigationView> createState() => _CustomNavigationViewState();
}

class _CustomNavigationViewState extends State<CustomNavigationView> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          backgroundColor: Appcolors.bottom_nav_color,
          selectedItemColor: Appcolors.white_color,
          selectedIconTheme: IconThemeData(
            color: Appcolors.white_color,
          ),
          unselectedItemColor: Appcolors.dark_text_color,
          items: [
            BottomNavigationBarItem(
        icon: SvgPicture.asset(Appassets.home_navigatorbar),
        label: 'Home',
        activeIcon: Container(
          width: 122,
          height: 48,
          decoration: BoxDecoration(
            color: Appcolors.dark_text_color,
            borderRadius: BorderRadius.circular(24),
          ),
          child:Row(
            children: [
              SizedBox(width: 9,),
              SvgPicture.asset(Appassets.home_navigatorbar,color: Appcolors.white_color,),
              SizedBox(width: 8,),
              Text("Home",
              style: TextStyle(
                color: Appcolors.white_color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              )
            ],
          ),
        )
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(Appassets.explore_navigatorbar),
        label: 'Explore',
        activeIcon: Container(
          width: 122,
          height: 48,
          decoration: BoxDecoration(
            color: Appcolors.dark_text_color,
            borderRadius: BorderRadius.circular(24),
          ),
          child:Row(
            children: [
              SizedBox(width: 9,),
              SvgPicture.asset(Appassets.explore_navigatorbar,color: Appcolors.white_color,),
              SizedBox(width: 8,),
              Text("Explore",
              style: TextStyle(
                color: Appcolors.white_color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              )
            ],
          ),
        )
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(Appassets.booked_navigatorbar),
        label: 'Saved',
        activeIcon: Container(
          width: 122,
          height: 48,
          decoration: BoxDecoration(
            color: Appcolors.dark_text_color,
            borderRadius: BorderRadius.circular(24),
          ),
          child:Row(
            children: [
              SizedBox(width: 9,),
              SvgPicture.asset(Appassets.booked_navigatorbar,color: Appcolors.white_color,),
              SizedBox(width: 8,),
              Text("Saved",
              style: TextStyle(
                color: Appcolors.white_color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              )
            ],
          ),
        )
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(Appassets.weather_navigatorbar),
        label: 'Settings',
        activeIcon: Container(
          width: 122,
          height: 48,
          decoration: BoxDecoration(
            color: Appcolors.dark_text_color,
            borderRadius: BorderRadius.circular(24),
          ),
          child:Row(
            children: [
              SizedBox(width: 9,),
              SvgPicture.asset(Appassets.weather_navigatorbar,color: Appcolors.white_color,),
              SizedBox(width: 8,),
              Text("Settings",
              style: TextStyle(
                color: Appcolors.white_color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              )
            ],
          ),
        )
      ),
    ],
    currentIndex: index,  // which item is selected
    onTap: (index) {
      Goto(context, Goto_page(context, index));
    },
        );
  }
}
