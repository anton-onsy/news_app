import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/widgets/custom_btn.dart';
import 'package:newsapp/features/home_screen/view/home_view.dart';
import 'package:newsapp/features/home_screen/view/location_view.dart';

class SearchView extends StatelessWidget {
   SearchView({super.key});
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Column(
        children: [
          Container(
                    margin: EdgeInsets.only(left: 34.w, right: 34.w,top: 46.h),
                    width: 362.w,
                    height: 48.h,
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "name you need to search for...",
                        prefixIcon: Icon(Icons.person_outline) ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                    LocationView(),
                    Positioned(
                      bottom: 28.h,
                      child: custom_button(
                        buttonText: "Get Started",
                        onPressed: (){
                          Goto(context, HomeView());
                        },
                        icon_string: Text(""),
                      ),
                    ),
                                      ],
                                    ),
                  )


        ],
      ),
      ),
    );
  }
}
