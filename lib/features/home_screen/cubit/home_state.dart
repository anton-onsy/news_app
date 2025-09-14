import 'package:newsapp/features/home_screen/data/models/headlines_model.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final HeadlinesModel model;

  HomeStateSuccess(this.model);
}

class HomeStateError extends HomeState {
  final String message;

  HomeStateError(this.message);
}