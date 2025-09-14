import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/home_screen/cubit/home_state.dart';
import 'package:newsapp/features/home_screen/data/models/headlines_model.dart';
import 'package:newsapp/features/home_screen/data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  
  static HomeCubit get(context) => BlocProvider.of(context);

    PageController pageController = PageController();
    HeadlinesModel? technologyModel;
    HeadlinesModel? businessModel;
    HeadlinesModel? sportsModel;
  getHeadlines(String searchQuery)async
  {
    HomeRepo homeRepo = HomeRepo();
    emit(HomeStateLoading());
    var response = await homeRepo.getHomeHeadlines(searchQuery);
    
    response.fold(
        (error)=> emit(HomeStateError(error)),
        (model){
           if(searchQuery == "Technology")
            {
              technologyModel = model;
            }
            else if(searchQuery == "Business")
            {
              businessModel = model;
            }
            else if(searchQuery == "Sports")
            {
              sportsModel = model;
            }
            emit(HomeStateSuccess(model));
        }
    );
  }
}