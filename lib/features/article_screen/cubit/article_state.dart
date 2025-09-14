import 'package:newsapp/features/article_screen/data/Models/article_model.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
}

class ArticleError extends ArticleState {
  final String message;

  ArticleError(this.message);
}