import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/features/article_screen/data/Models/article_model.dart';
import 'package:newsapp/features/settings_screen/data/models/weather_model.dart';

class WeatherRepo
{
  Future<Either<String, WeatherModel>> getWeather()async
  {
    try
    {
      var dio = Dio();
      var response = await dio.get(
     'https://api.openweathermap.org/data/2.5/weather?lat=30.5877893&lon=31.4798788&appid=39ef56aa87e0f9d833e66cd9111de959&units=metric'
      );

      WeatherModel model = WeatherModel.fromJson(response.data as Map<String, dynamic>);
      return Right(model);
    }
    on DioException catch(e)
    {
      var errorResponse = e.response?.data as Map<String, dynamic>?;

        if (errorResponse != null) {
          print(errorResponse['message']);
           return Left(errorResponse['message']);
        } else {
          print("No error data available");
          return Left("Something went wrong");
        }
    }
    catch(e)
    {
      print(e.toString());
      return Left(e.toString());
    }
  }
}