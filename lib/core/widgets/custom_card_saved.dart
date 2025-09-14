import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appcolors.dart';

class CustomCardSaved extends StatelessWidget {
  const CustomCardSaved({super.key, required this.title, required this.image,required this.category});
  final String title;
  final String image;
  final String category;

  @override
  Widget build(BuildContext context) {
    if(image.isNotEmpty){
    return Column(
      children: [
        Container(
          width: 400,
          height: 90,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(8) ),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            width: 220.w,
            height: 76.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220.w,
                      height: 48.h,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 190.w,
                      height: 29.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width:158 ,
                            height: 50,
                            child: Text("${category}",style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Appcolors.light_text_color
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                 SizedBox(width: 3.w),
                Container(
                  width: 100.w,
                  height: 80.h,
                  padding: EdgeInsets.only(right: 32.w),
                  decoration: BoxDecoration(
                  //color: Appcolors.button_background_color,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      image
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
  else{
    return Column(
      children: [
        Container(
          width: 400,
          height: 90,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(8) ),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            width: 220.w,
            height: 76.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220.w,
                      height: 48.h,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 190.w,
                      height: 29.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 6.w,),
                          Container(
                            width:158 ,
                            height: 50,
                            child: Text("${category}",style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Appcolors.light_text_color
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                 SizedBox(width: 3.w),
                Container(
                  width: 100.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child:  Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
  }
}