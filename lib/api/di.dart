import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/WebServices.dart';
import 'package:ecommerce_app/api/token_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetWorkModule {
  // -> provide dependancies

  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: 'https://ecommerce.routemisr.com',
      receiveDataWhenStatusError: true,
      headers: {
        'token': 'application/json',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    dio.interceptors.add(TokenInterceptor()); // Add this code

    return dio;
  }

  @singleton
  @injectable
  WebServices provideWebServices(Dio client) => WebServices(client);
}
