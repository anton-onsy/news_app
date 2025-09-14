import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
class custom_button extends StatelessWidget {

  final String buttonText;
  final void Function() onPressed;
  final Widget icon_string;
  const custom_button({super.key,required this.buttonText,required this.onPressed, required this.icon_string});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                            onPressed: onPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolors.button_background_color,
                              elevation: 1,
                              foregroundColor: Appcolors.button_text_color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(128.sp),
                              ),
                              //padding: EdgeInsets.symmetric(horizontal: 24.w),
                            ),
                            child: Container(
                              width: 150.w,
                              height: 46.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(buttonText,
                                  style: TextStyle(
                                    color: Appcolors.button_text_color,
                                    fontFamily: "Cairo",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    child: IconButton(iconSize:16 ,onPressed: onPressed, icon: icon_string,
                                    color: Appcolors.button_text_color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
  }
}