import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/categories_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'WebServices.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com')
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET("/api/v1/categories")
  Future<CategoriesResponse> getCategories();
}
