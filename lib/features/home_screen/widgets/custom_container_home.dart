import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appcolors.dart';

class CustomContainerHome extends StatelessWidget {
  final String text;
  final String imageUrl;  
  final String type;
  const CustomContainerHome({super.key,required this.text,required this.imageUrl, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 32.w),
      child: Container(
        width: 240.w,
        height: 390.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 240.w,
              height: 232.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl
                  ),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Text(text,style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Appcolors.dark_text_color,
            ),
            ),
            SizedBox(height: 5.h),
            Text(type,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Appcolors.light_text_color,
            ),),
          ],
        ),
      ),
    );
  }
}