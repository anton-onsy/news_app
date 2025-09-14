import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/utils/Appconstants.dart';
import 'package:newsapp/features/home_screen/view/home_view.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                height: 142.h,
                decoration: BoxDecoration(
                  color: Appcolors.profile_color,
              
                ),
                child:
                Container(
                  width: 366.w,
                  height: 64.h,
                  margin: EdgeInsets.only(left: 32.w,right: 32.w,top: 68.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good morning, "),
                          Text("Anton onsy"),
                          Text("${weekdays[DateTime.now().weekday - 1]} ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Appcolors.dark_text_color,
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(Appassets.profile_sun_image),
                              SizedBox(width:8.w),
                              Text("Sunny,32°C"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              );
  }
}