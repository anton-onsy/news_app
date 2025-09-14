import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_btn.dart';

class CustomStackOverlay extends StatelessWidget {
 final void Function() onPressed;
  const CustomStackOverlay({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: 350.h,
                    child: Image.asset(
                      Appassets.welcome_image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 320.h,
                    right: 0.w,
                    left: 0.w,
                    child: Container(
                    width: 430.w,
                    height: 421.h,
                    decoration: BoxDecoration(
                      color: Appcolors.white_color,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32.sp),topRight: Radius.circular(32.sp))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 52.h,),
                        Container(
                          width: 366.w,
                          height: 80.h,
                          margin: EdgeInsets.symmetric(horizontal: 32.w),
                          child: Text("Get The Latest News And Updates",
                          style: TextStyle(
                            color: Appcolors.dark_text_color,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        Container(
                          width: 366.w,
                          height: 103.h,
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          child: Text("From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Globe will be right on your hand.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Appcolors.light_text_color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                        ),
                        SizedBox(height: 24.h,),
                        Container(
                          width: 151.w,
                          height: 46.h,
                          child: custom_button(
                            buttonText: "Explore",
                            onPressed: onPressed,
                            icon_string:SvgPicture.asset(Appassets.explore_arrow_icon,width: 16.w,height: 11.h,),
                          ),
                        )
                      ],
                    ),
                  )
                  ),            
              ],
            );
  }
}