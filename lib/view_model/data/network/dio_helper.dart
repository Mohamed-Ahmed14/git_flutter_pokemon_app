

import 'package:dio/dio.dart';
import 'package:pokemon_app/view_model/data/network/end_points.dart';

class DioHelper{
  static Dio? dio;

  static void init(){
    dio=Dio(
      BaseOptions(
        //baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> get({required String url,
    Map<String,dynamic>? queryParameters,
    Map<String,dynamic>? body,
    Map<String,dynamic>? headers})async{
   try{
     dio!.options.headers =headers;
    return   dio!.get(url,
       queryParameters: queryParameters,
      data: body
     );
   }catch(e)
    {
      rethrow;
    }
  }

}