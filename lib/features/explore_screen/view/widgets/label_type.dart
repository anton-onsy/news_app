import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appcolors.dart';

class LabelType extends StatefulWidget {
   LabelType({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LabelTypeState();
  }
}

class _LabelTypeState extends State<LabelType> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 131.w,
      height: 32.h,
      margin: EdgeInsets.only(left: 6.w, right: 6.w),
      decoration: BoxDecoration(
            color: selected ? Appcolors.profile_color : Appcolors.transparent_color,
           borderRadius: BorderRadius.circular(56),
          
          ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selected = !selected;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            selected ? Appcolors.profile_color : Appcolors.transparent_color,
          ),
          elevation: MaterialStatePropertyAll(0),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: selected ? Appcolors.profile_color : Appcolors.light_text_color,
              width: .1,
            ),
          ),
        ),
        child: Container(
          width:83.w ,
          height:20.h,
          child: Center(
            child: Text("Technology",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Appcolors.dark_text_color,
            ),),
          ),
      
        ),
      ),
    );
  }
}