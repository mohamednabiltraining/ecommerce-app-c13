import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/brands/brands_response.dart';
import 'package:ecommerce_app/api/model/response/categories/categories_response.dart';
import 'package:ecommerce_app/api/model/response/products/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'WebServices.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com')
abstract class WebServices {
  @factoryMethod
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET("/api/v1/categories")
  Future<CategoriesResponse> getCategories();

  @GET("/api/v1/brands")
  Future<BrandsResponse> getBrands();

  @GET("/api/v1/products")
  Future<ProductsResponse> getProducts({
    @Query("limit") int limit = 10,
    @Query("sort") String? sort,
    @Query("search") String? search,
    @Query("category") String? category,
    @Query("brand") String? brand,
    @Query("page") int page = 1,
  });
}
