import 'package:flutter/material.dart';
import 'package:newsapp/features/explore_screen/view/explored_view.dart' show ExploredView;
import 'package:newsapp/features/home_screen/cubit/location_cubit.dart';
import 'package:newsapp/features/home_screen/view/home_view.dart';
import 'package:newsapp/features/saved_screen/view/saved_view.dart';
import 'package:newsapp/features/settings_screen/view/settings_view.dart';

Widget Goto_page(BuildContext context, int index) {
  switch (index) {
    case 0:
      return HomeView(index: index);
    case 1:
      return ExploredView(index: index);
    case 2:
      return SavedView(index: index, savedArticles: {},);
    case 3:
      return SettingsView(index: index,);
    default:
      return HomeView();
  }
}