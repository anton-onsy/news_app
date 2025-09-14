import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/article_screen/cubit/article_state.dart';
import 'package:newsapp/features/explore_screen/cubit/news_state.dart';
import 'package:newsapp/features/explore_screen/data/repo/news_repo.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  static ArticleCubit get(context) => BlocProvider.of(context);
  late bool selected;

  savedstate()
  {
   selected=!selected;
   emit(ArticleSuccess());
  }
}