import 'package:flutter/material.dart';
import 'package:newsapp/core/helper/navigator.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_card_saved.dart';
import 'package:newsapp/core/widgets/cutom_navigationbar.dart';
import 'package:newsapp/features/article_screen/data/Models/article_model.dart';
import 'package:newsapp/features/article_screen/view/article_view.dart';
import 'package:newsapp/features/explore_screen/view/explored_view.dart';
import 'package:newsapp/features/home_screen/view/home_view.dart';

class SavedView extends StatelessWidget {
   const SavedView({super.key,required this.index,required this.savedArticles});
  final int index;
  final Map<String, dynamic> savedArticles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Goto(context, ExploredView(index: 1));
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        backgroundColor: Appcolors.profile_color,
        elevation: 0,
        centerTitle: true,
        title: Text('Bookmark',style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              child: ListView.builder(
                itemCount: savedArticles.length,
                itemBuilder: (context, index) {
                  String title = savedArticles.keys.elementAt(index);
                  String imageUrl = savedArticles[title]['imageUrl'];
                  String category = savedArticles[title]['category'];
                  return CustomCardSaved(title: title, image: imageUrl, category: category);
                },
              ),
              onTap: () {

                Goto(context, ArticleView(title: savedArticles[savedArticles.keys.elementAt(index)]['title'],
                 author: savedArticles[savedArticles.keys.elementAt(index)]['author'],
                  publishedAt: savedArticles[savedArticles.keys.elementAt(index)]['publishedAt'],
                   content: savedArticles[savedArticles.keys.elementAt(index)]['content'],
                    image: savedArticles[savedArticles.keys.elementAt(index)]['image'],
                     onPressed: () { 
                      Goto(context, HomeView());
                      },));
              },
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: CustomNavigationView(index: index),
    );
  }
}