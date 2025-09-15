import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/features/home_screen/data/models/headlines_model.dart';

class HomeRepo
{
  Future<Either<String, HeadlinesModel>> getHomeHeadlines(String searchQuery)async
  {
    try
    {
      var dio = Dio();
      var response = await dio.get(
     'https://newsapi.org/v2/top-headlines?q=a&apiKey=836086f05b344448a16dd41ee51c6320&category=$searchQuery&country=us&pageSize=2&page=1'
      );

      HeadlinesModel model = HeadlinesModel.fromJson(response.data as Map<String, dynamic>);
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