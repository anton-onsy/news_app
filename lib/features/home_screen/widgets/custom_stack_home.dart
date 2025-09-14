import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStackHome extends StatelessWidget {
  const CustomStackHome({super.key, required this.imageUrl, required this.title, required this.author});

  final String imageUrl;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: Container(
            width: 376.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.sp),
                bottomRight: Radius.circular(8.sp),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, top: 3.h, bottom: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 220.w,
                    height: 62.h,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(width: 7.h),
                  Container(
                    width: 55.w,
                    height: 35.h,
                    child: Text(
                      author,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}