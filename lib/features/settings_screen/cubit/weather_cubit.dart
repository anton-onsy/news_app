import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newsapp/features/settings_screen/cubit/weather_state.dart';
import 'package:newsapp/features/settings_screen/data/Repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);
  late LatLng latLng;

  getWeather()async
  {
    WeatherRepo weatherRepo = WeatherRepo();
    emit(WeatherLoading());
    var response = await weatherRepo.getWeather();
    response.fold(
        (error)=> emit(WeatherError(error)),
        (model)=> emit(WeatherSuccess(model))
    );
  }
}