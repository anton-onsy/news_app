import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/explore_screen/cubit/Popup_state.dart';

class PopupCubit extends Cubit<PopupState> {
  PopupCubit() : super(PopupInitialState());
  // String selectedType = '';
  // String selectedStatus = '';

  TextEditingController searchController = TextEditingController();
  static PopupCubit get(context) => BlocProvider.of(context);


  // void selectType(String option) {
  //   selectedType = option;
  //   emit(SelectedTypeState());
  // }
  // void selectStatus(String option) {
  //   selectedStatus = option;
  //   emit(SelectedStatusState());
  // }
}