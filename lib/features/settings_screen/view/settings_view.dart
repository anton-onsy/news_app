import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_btn.dart';
import 'package:newsapp/core/widgets/custom_profile.dart';
import 'package:newsapp/core/widgets/cutom_navigationbar.dart';
import 'package:newsapp/features/home_screen/view/location_view.dart';
import 'package:newsapp/features/settings_screen/cubit/weather_cubit.dart';
import 'package:newsapp/features/settings_screen/cubit/weather_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key,required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(),
      child: Scaffold(
        body: 
        SingleChildScrollView(
        child: 
        BlocBuilder<WeatherCubit,WeatherState>(
          builder: (context, state) {
            if(state is WeatherLoading)
            {
              return const Center(child: CircularProgressIndicator(color: Appcolors.button_background_color,),);
            }
            else if(state is WeatherSuccess)
            {
              return  Column(
            children: [
              CustomProfile(),
              SizedBox(height: 29.h),
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: 
                Row(
                  children: [
                    Text("${state.model.sys?.country} - ${state.model.name}",style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.dark_text_color,
                    ),
                    ),
                  ],
                ),
              ),
              Row(
                      children: [
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 32.w) ,
                          child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${state.model.main!.temp!.floor()}",style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                color: Appcolors.dark_text_color,
                              ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 175.w),
                                child: SizedBox(
                                  width: 60.w,
                                  height: 60.h,
                                  child: 
                                  Image(image: AssetImage(Appassets.profile_big_sun))),
                              ),
                
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 31.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 272.w,
                              height: 48.h,
                              margin: EdgeInsets.only(left: 32.w),
                              child: Text("${state.model.weather?.first.main}-${state.model.weather?.first.description}",style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.dark_text_color,
                              ),
                              ),
                            ),
                          ],
                        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120.w,
                    height: 39.h,
                    margin: EdgeInsets.only(left: 20.w),
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text("Feels like ${state.model.main!.feelsLike!.round()}",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.light_text_color,
                      ),
                      textAlign: TextAlign.right,
                      ),
                    ),
                ]
              ),  
              SizedBox(height: 45.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                padding: EdgeInsets.only(left: 32.w,right: 15.w,bottom:15.h ),
                child: Row(  
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  width: 42.4277458190918.w,
                  height: 45.h,
                  
                  child: Image.asset(Appassets.heat_icon),
                ),
                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${(state.model.main!.temp! * 9/5 + 32).floor()}°",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Appcolors.button_background_color,
                    ),),
                    Text("Fahrenheit",style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.light_text_color,
                    ),)
                  ],
                )
                ],
                ),
              ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.w,bottom: 15.h),
                    child: Row(  
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      width: 42.4277458190918.w,
                      height: 45.h,
                      child: Image.asset(Appassets.wind_icon),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${(state.model.main?.pressure)} mp/h",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Appcolors.button_background_color,
                        ),),
                        Text("Pressure",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Appcolors.light_text_color,
                        ),)
                      ],
                    )
                    ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                padding: EdgeInsets.only(left: 32.w,right: 15.w,bottom:15.h ),
                child: Row(  
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  width: 42.4277458190918.w,
                  height: 45.h,
                  child: Image.asset(Appassets.sun_icon),
                ),
                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${(state.model.dt! < state.model.sys!.sunrise!)||(state.model.dt! > state.model.sys!.sunset!) ? 0 : (Random().nextDouble()* 10).floorToDouble() / 10}",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Appcolors.button_background_color,
                    ),),
                    Text("UV Index",style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.light_text_color,
                    ),)
                  ],
                )
                ],
                ),
              ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.w,bottom: 15.h),
                    child: Row(  
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      width: 42.4277458190918.w,
                      height: 45.h,
                      child: Image.asset(Appassets.rain_icon),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${(state.model.main?.humidity)}%",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Appcolors.button_background_color,
                        ),),
                        Text("Humidity",style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Appcolors.light_text_color,
                        ),)
                      ],
                    )
                    ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              custom_button(
                buttonText: "Change Loc",
              onPressed: (){
                Goto(context,LocationView());
                //WeatherCubit.get(context).getWeather();
              },
               icon_string: Image(image: AssetImage(Appassets.location_icon)))
              ]
              );
            }
            else if(state is WeatherError)
            {
              return Text(state.message);
            }
            else
            {
              return SizedBox();
            }
          },
          
        )
            ),
      bottomNavigationBar: CustomNavigationView(index: index,),),
    );
  }
}