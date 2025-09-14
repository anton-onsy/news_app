import 'package:dartz/dartz.dart';
import 'package:newsapp/core/network/api_helper.dart';
import 'package:newsapp/core/network/end_points.dart';
import 'package:newsapp/features/article_screen/data/Models/article_model.dart';

class NewsRepo
{
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, ResponseModelView>> getEveryThing(String q)async
  {
    try
    {
       var response = await apiHelper.getRequest(
        endPoint: EndPoints.everything,
          queryParameters: {
            'q': q.isEmpty ? 'all' : q,
            'apiKey': '836086f05b344448a16dd41ee51c6320',
          }
        );
      if(response.status)
      {
        ResponseModelView model = ResponseModelView.fromJson(response.data as Map<String, dynamic>);
        return Right(model);
      }
      else
      {
        return Left(response.message);
      }
    }
      catch(e)
    {
      print(e.toString());
      return Left(e.toString());
    }
  }
}