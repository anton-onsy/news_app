import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_card_explored.dart';
import 'package:newsapp/features/article_screen/data/Models/article_model.dart';
import 'package:newsapp/features/article_screen/view/article_view.dart';
import 'package:newsapp/features/explore_screen/cubit/news_cubit.dart';
import 'package:newsapp/features/explore_screen/cubit/news_state.dart';
import 'package:newsapp/features/explore_screen/view/explored_view.dart';
import 'package:newsapp/features/explore_screen/view/widgets/label_type.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: Scaffold(
        backgroundColor: Appcolors.white_color,
        appBar: AppBar(
          title: Text('Search Results',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Appcolors.dark_text_color
          ),
        ),
        centerTitle: true,
        backgroundColor: Appcolors.white_color,
        leading: IconButton(
          onPressed: () {
            Goto(context, ExploredView(index: 1));
          },
          icon: Icon(Icons.arrow_back)),
        ),
        body: ListView(
          children: [
            SizedBox(height: 16.h),
            SizedBox(
              width: 430.w,
              height: 34.h,
              child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              LabelType(),
                              LabelType(),
                              LabelType(),
                              LabelType(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      BlocBuilder<NewsCubit, NewsState>(
                      builder: (context,state) {
                        if(state is NewsLoading){
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(state is NewsError){
                          print("No data found");
                          return Center(child: Text('${state.message}'));
                        }
                        else if(state is NewsSuccess){
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.model.articles!.length - 1,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: CustomCardExplored(
                                  Auth_image: Appassets.profile_image,
                                  title: state.model.articles![index].title ?? '',
                                  Auth_date:
                                      state.model.articles![index].publishedAt ?? '',
                                  Auther: state.model.articles![index].author ??
                                      'Unknown',
                                  image:
                                      state.model.articles![index].urlToImage ?? '',
                                ),
                                onTap: () {
                              Goto(context, ArticleView(
                              image: state.model.articles![index].urlToImage ?? '',
                              title: state.model.articles![index].title ?? '',
                              author: state.model.articles![index].author ?? '',
                              publishedAt: state.model.articles![index].publishedAt ?? '',
                              content: state.model.articles![index].content ?? '',
                              onPressed: () {
                                Goto(context, ExploredView(index: 1));
                              },
                            ));
                          },
                              );
                            },
                          );
                        }
                        else{
                          return Center(child: Text('No Data'));
                        }
                      }
                    ),
          ],
        ),
      ),
    );
  }
}