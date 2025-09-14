import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/utils/Appassets.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/features/article_screen/cubit/article_cubit.dart';
import 'package:newsapp/features/article_screen/cubit/article_state.dart';

class ArticleView extends StatelessWidget {
   ArticleView({super.key, required this.title, required this.author, required this.publishedAt, required this.content, required this.image, required this.onPressed});
  final String title;
  final String author;
  final String publishedAt;
  final String content;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleCubit()..savedstate(),
      child: Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 316,
                child: Image.network(image, fit: BoxFit.cover,),
              ),
              Positioned(
                top: 271,
                bottom: 0,
                right:0,
                left: 0,
                child:Container(
                          width: 430.w,
                          height: 421.h,
                          decoration: BoxDecoration(
                            color: Appcolors.white_color,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32.sp),topRight: Radius.circular(32.sp))
                          ),
                          child: 
                          Column(
                            children: [
                              BlocBuilder<ArticleCubit,ArticleState>(
                                builder: (context, state) {
                                  if(state is ArticleLoading ){
                                    return Center(child: CircularProgressIndicator(
                                      color: Appcolors.button_background_color,
                                    )
                                    );
                                  }
                                  else if(state is ArticleError){
                                    return Center(child: Text('Error loading article'));
                                  }
                                  else if (state is ArticleSuccess){
                                    return Container(
                                  width: 430,
                                  height: 68,
                                  padding:EdgeInsets.only(left: 10.w,right: 10.w),
                                  decoration: BoxDecoration(
                                  color:Appcolors.bottom_nav_color,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32.sp),topRight: Radius.circular(32.sp))
                                  ),        
                                  child: 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                    IconButton(onPressed:onPressed, icon: Icon(Icons.arrow_back_rounded)),
                                    SizedBox(width: 159.w,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: (){
                                          
                                        }, icon: Icon(Icons.bookmark_border)),
                                        IconButton(onPressed: (){}, icon: ImageIcon(AssetImage(Appassets.share_icon))),      
                                      ],
                                    )
                                   ],
                                  ),
                                );
                                  }
                                  else{
                                     return SizedBox();
                                  }
                                }
                              ),
                              Container(
                                width: 366,
                                height: 140,
                                padding: EdgeInsets.only(bottom:20),
                                child: 
                                Column(
                                  children: [
                                    Container(
                                      width: 366,
                                      height: 90,
                                      //color: Colors.black,
                                      padding: EdgeInsets.only(left: 32.w),
                                      child: Text(title,
                                      style: 
                                      TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        color: Appcolors.dark_text_color,
                                      ),
                                      ),
                                    ),
                                     Padding(
                                      padding: EdgeInsets.only(left:32.w),
                                      child: SizedBox(
                                        width:366 ,
                                        height: 24,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              child: Image.asset(Appassets.profile_image,),
                                              ),
                                              SizedBox(width: 6.w,),
                                            Text("$author · $publishedAt",style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Appcolors.light_text_color
                                            ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),                      
                              SizedBox(height: 12.h,),
                              Expanded(
                                child:
                                SingleChildScrollView(
                                  child: Container(
                                   padding: EdgeInsets.only(left: 32.w,right: 32.w), 
                                  child:Text(content,
                                  style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Appcolors.dark_text_color
                                  ),
                                  ),
                                  ),
                                )
                              )
                            ],
                            )  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}