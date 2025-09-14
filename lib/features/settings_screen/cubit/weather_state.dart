import 'package:newsapp/features/settings_screen/data/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel model;

  WeatherSuccess(this.model);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}