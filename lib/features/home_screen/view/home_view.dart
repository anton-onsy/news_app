import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/helper/navigator_page.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_profile.dart';
import 'package:newsapp/core/widgets/cutom_navigationbar.dart';
import 'package:newsapp/features/explore_screen/view/explored_view.dart';
import 'package:newsapp/features/home_screen/cubit/home_cubit.dart';
import 'package:newsapp/features/home_screen/cubit/home_state.dart';
import 'package:newsapp/features/home_screen/data/repo/home_repo.dart';
import 'package:newsapp/features/home_screen/widgets/custom_container_home.dart';
import 'package:newsapp/features/home_screen/widgets/custom_stack_home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeView extends StatelessWidget {
  HomeView({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getHeadlines("Technology")
        ..getHeadlines("Sports")
        ..getHeadlines("Business"),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = HomeCubit.get(context);

              if (state is HomeStateLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeStateSuccess) {
                if (cubit.technologyModel == null ||
                    cubit.sportsModel == null ||
                    cubit.businessModel == null) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    CustomProfile(),
                    SizedBox(height: 24.h),
                    Container(
                      width: 376.w,
                      height: 274.h,
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: PageView(
                        controller: cubit.pageController,
                        children: [
                          CustomStackHome(
                            imageUrl: cubit.technologyModel!.articles![0].urlToImage??"https://lightwidget.com/wp-content/uploads/localhost-file-not-found.jpg",
                            title: cubit.technologyModel!.articles![0].title!,
                            author: cubit.technologyModel!.articles![0].author ?? "Unknown",
                          ),
                          CustomStackHome(
                            imageUrl: cubit.sportsModel!.articles![0].urlToImage??"https://lightwidget.com/wp-content/uploads/localhost-file-not-found.jpg",
                            title: cubit.sportsModel!.articles![0].title!,
                            author: cubit.sportsModel!.articles![0].author ?? "Unknown",
                          ),

                          CustomStackHome(
                            imageUrl: cubit.businessModel!.articles![0].urlToImage??"https://lightwidget.com/wp-content/uploads/localhost-file-not-found.jpg",
                            title: cubit.businessModel!.articles![0].title!,
                            author: cubit.businessModel!.articles![0].author ?? "Unknown",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Container(
                      child: SmoothPageIndicator(
                        controller: cubit.pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.blue,
                          dotColor: Colors.grey,
                          dotHeight: 12.h,
                          dotWidth: 12.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),


                    Container(
                      width: 377.w,
                      height: 44.h,
                      margin: EdgeInsets.only(left: 32.w, right: 22.w),
                      child: Row(
                        children: [
                          Container(
                            width: 230.w,
                            height: 28.h,
                            child: Text(
                              "Most popular",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.dark_text_color,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "See more",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.button_background_color,
                              ),
                            ),
                            onTap: () {
                              Goto(context, ExploredView(index: 1));
                            },
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomContainerHome(
                            text: cubit.technologyModel!.articles![1].title!,
                            imageUrl: cubit.technologyModel!.articles![1].urlToImage!,
                            type: "technology",
                          ),
                          CustomContainerHome(
                            text: cubit.sportsModel!.articles![1].title!,
                            imageUrl: cubit.sportsModel!.articles![1].urlToImage!,
                            type: "sports",
                          ),
                          CustomContainerHome(
                            text: cubit.businessModel!.articles![1].title!,
                            imageUrl: cubit.businessModel!.articles![1].urlToImage!,
                            type: "business",
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is HomeStateError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ),
        bottomNavigationBar: CustomNavigationView(),
      ),
    );
  }

}
