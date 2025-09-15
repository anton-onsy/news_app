import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_card_explored.dart';
import 'package:newsapp/core/widgets/cutom_navigationbar.dart';
import 'package:newsapp/features/article_screen/view/article_view.dart';
import 'package:newsapp/features/explore_screen/cubit/news_cubit.dart';
import 'package:newsapp/features/explore_screen/cubit/news_state.dart';
import 'package:newsapp/features/explore_screen/view/popup_view.dart';
import 'package:newsapp/features/explore_screen/view/widgets/label_type.dart';

class ExploredView extends StatelessWidget {
  const ExploredView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.profile_color,
          title: Text(
            "Explore",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Appcolors.dark_text_color,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Goto(context, FilterPopup());
              },
            ),
          ],
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsSuccess) {
              if (state.model.articles?.isEmpty ?? true) {
                return const Center(child: Text('No Data'));
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<NewsCubit>().getNews();
                },
                child: ListView(
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
                    GestureDetector(
                      onTap: () {
                        Goto(
                          context,
                          ArticleView(
                            title: state.model.articles![0].title ?? '',
                            author: state.model.articles![0].author ?? '',
                            image: state.model.articles![0].urlToImage ??
                                'https://lightwidget.com/wp-content/uploads/localhost-file-not-found.jpg',
                            publishedAt:
                                state.model.articles![0].publishedAt ?? '',
                            content: state.model.articles![0].content ?? '',
                            onPressed: () {
                              Goto(context, ExploredView(index: 1));
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 366.w,
                        height: 350.h,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          children: [
                            Container(
                              width: 366.w,
                              height: 206.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: state.model.articles![0].urlToImage !=
                                            null &&
                                        state.model.articles![0].urlToImage!
                                            .isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(state
                                            .model.articles![0].urlToImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: (state.model.articles![0].urlToImage ==
                                          null ||
                                      state.model.articles![0].urlToImage!
                                          .isEmpty)
                                  ? const Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : null,
                            ),
                            Container(
                              width: 366.w,
                              height: 140.h,
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Column(
                                children: [
                                  Container(
                                    width: 366.w,
                                    height: 90.h,
                                    child: Text(
                                      state.model.articles![0].title ?? '',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Appcolors.dark_text_color,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 366,
                                    height: 24,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          child:
                                              Image.asset(Appassets.profile_image),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          "${state.model.articles![0].author ?? 'Unknown'} · ${state.model.articles![0].publishedAt ?? ''}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Appcolors.light_text_color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.model.articles!.length - 1,
                      itemBuilder: (context, index) {
                        final article = state.model.articles![index + 1];
                        return GestureDetector(
                          onTap: () {
                            Goto(
                              context,
                              ArticleView(
                                title: article.title ?? '',
                                author: article.author ?? 'Unknown',
                                publishedAt: article.publishedAt ?? '',
                                content: article.content ?? '',
                                image: article.urlToImage ??
                                    'https://lightwidget.com/wp-content/uploads/localhost-file-not-found.jpg',
                                onPressed: () {
                                  Goto(context, ExploredView(index: 1));
                                },
                              ),
                            );
                          },
                          child: CustomCardExplored(
                            Auth_image: Appassets.profile_image,
                            title: article.title ?? '',
                            Auth_date: article.publishedAt ?? '',
                            Auther: article.author ?? 'Unknown',
                            image: article.urlToImage ?? '',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: CustomNavigationView(index: index),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:newsapp/core/helper/navigator.dart';
// import 'package:newsapp/core/utils/Appassets.dart';
// import 'package:newsapp/core/utils/Appcolors.dart';
// import 'package:newsapp/core/widgets/custom_card_explored.dart';
// import 'package:newsapp/core/widgets/cutom_navigationbar.dart';
// import 'package:newsapp/features/explore_screen/cubit/news_cubit.dart';
// import 'package:newsapp/features/explore_screen/cubit/news_state.dart';
// import 'package:newsapp/features/explore_screen/view/popup_view.dart';
// import 'package:newsapp/features/explore_screen/view/widgets/label_type.dart';

// class ExploredView extends StatelessWidget {
//   const ExploredView({super.key, required this.index});
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => NewsCubit()..getNews(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Appcolors.profile_color,
//           title: Text("Explore", style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: Appcolors.dark_text_color,
//           )),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 Goto(context, FilterPopup());
//               },
//             ),
//           ],
//         ),
//         body: BlocBuilder<NewsCubit, NewsState>(
//           builder: (context, state){
//             if (state is NewsLoading) {
//               return 
//               Center(
//                 child: CircularProgressIndicator()
//                 );
//             } 
//             else if (state is NewsSuccess) {
//                if(state.model.articles?.isEmpty??true) {
//                       return Center(child: Text('No Data'),);
//                     }
//                     return 
//                     Column(
//                       children: [
//                         SizedBox(height: 16.h),
//                         SizedBox(
//                           width: 430.w,
//                           height: 34.h,
//                           child: SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: [
//                                 LabelType(),
//                                 LabelType(),
//                                 LabelType(),
//                                 LabelType(),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 24.h),
//                         Container(
//                           width: 366.w,
//                           height: 350.h,
//                           padding: EdgeInsets.symmetric(horizontal: 32.w),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: 366.w,
//                                 height: 206.h,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: NetworkImage(state.model.articles![0].urlToImage ?? ''),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                     width: 366.w,
//                                     height: 140.h,
//                                     padding: EdgeInsets.only(bottom:20.h),
//                                     child: 
//                                     Column(
//                                       children: [
//                                         Container(
//                                           width: 366.w,
//                                           height: 90.h,
//                                           //color: Colors.black,
//                                           child: Text(state.model.articles![0].title ?? '',
//                                           style: 
//                                           TextStyle(
//                                             fontSize: 24,
//                                             fontWeight: FontWeight.w600,
//                                             color: Appcolors.dark_text_color,
//                                           ),
//                                           ),
//                                         ),
//                                          SizedBox(
//                                            width:366 ,
//                                            height: 24,
//                                            child: Row(
//                                              children: [
//                                                CircleAvatar(
//                                                  radius: 12,
//                                                  child: Image.asset(Appassets.profile_image,),
//                                                  ),
//                                                  SizedBox(width: 6.w,),
//                                                Text("${state.model.articles![0].author ?? 'Unknown'} · ${state.model.articles![0].publishedAt ?? ''}",style: TextStyle(
//                                                  fontSize: 12,
//                                                  fontWeight: FontWeight.w400,
//                                                  color: Appcolors.light_text_color
//                                                ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                       ],
//                                     )
//                                   ),
                          
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                           itemCount: state.model.articles!.length-1,
//                           itemBuilder: (context, index)
//                           {
//                             return CustomCardExplored(
//                               Auth_image: Appassets.profile_image,
//                               title: state.model.articles![index+1].title ?? '',
//                               Auth_date: state.model.articles![index+1].publishedAt ?? '',
//                               Auther: state.model.articles![index+1].author ?? 'Unknown',
//                               image: state.model.articles![index+1].urlToImage ?? '',
//                             );
//                           }
//                           ),
//                         )
//                       ],
//                     );
//                     }
//              else if (state is NewsError) {
//               return 
//               Center(
//                 child: Text(state.message)
//                 );
//             }
//             return SizedBox();
//           }
//            ),
//         bottomNavigationBar: CustomNavigationView(index: index),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return FilterPopup();
//               },
//             // ).then((value) {
//             //   if (value != null && value != PopupCubit.get(context).searchController.text) {
//             //     NewsCubit.get(context).sendFilter(value);
//             //   }
//             // }
//             );
//           },
//           child: Icon(Icons.filter_list),
//         ),
//       ),
//     );
//   }
// }