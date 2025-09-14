import 'package:newsapp/features/article_screen/data/Models/article_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final ResponseModelView model;

  NewsSuccess(this.model);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
