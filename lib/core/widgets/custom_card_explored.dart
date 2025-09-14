import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';

class CustomCardExplored extends StatelessWidget {
  const CustomCardExplored({super.key,required this.Auth_image, required this.title, required this.Auth_date, required this.Auther, required this.image});
  final String Auth_image;
  final String title;
  final String Auther;
  final String Auth_date;
  final String image;

  @override
  Widget build(BuildContext context) {
    if(image.isNotEmpty){
    return Column(
      children: [
        Container(
          width: 400,
          height: 100,
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
                          CircleAvatar(
                            radius: 12,
                            child: Image.asset(Auth_image),
                          ),
                          SizedBox(width: 6.w,),
                          Container(
                            width:158 ,
                            height: 30,
                            child: Text("$Auther . $Auth_date",style: TextStyle(
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
                          CircleAvatar(
                            radius: 12,
                            child: Image.asset(Auth_image),
                          ),
                          SizedBox(width: 6.w,),
                          Container(
                            width:158 ,
                            height: 50,
                            child: Text("$Auther . $Auth_date",style: TextStyle(
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