import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/features/explore_screen/cubit/news_cubit.dart';
import 'package:newsapp/features/explore_screen/cubit/news_state.dart';
import 'package:newsapp/features/explore_screen/view/explored_view.dart';
import 'package:newsapp/features/explore_screen/view/search_result_view.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsCubit(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 16.h,),
                  Container(
                    width: 366,
                    height: 90,
                    margin:EdgeInsets.only(left: 32.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 240.w,
                          height: 48.h,
                          child: TextField(
                            maxLength: 16,
                            onSubmitted: (value) {
                             Goto(context, SearchResultView());
                            },
                            controller: NewsCubit.get(context).searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  NewsCubit.get(context).searchController.clear();
                                },
                              ),
                              border: OutlineInputBorder(),
                          ),
                          
                          ),
                        ),
                       SizedBox(width: 6.w,),
                        SizedBox(
                          width: 70.w,
                          height: 48.h,
                          child: TextButton(
                                              onPressed: () => Goto(context,ExploredView(index: 1)),
                                               child: Text("cancel",
                                               style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                                              ),
                                              )
                                              ),
                        )
                      ],
                    ),
                  ),
                 
                  
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}