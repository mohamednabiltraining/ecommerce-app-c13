import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/app_secure_storage.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Here you can put the token, either from preference, sqlite, etc.
    // Here is an example with Preferences
    final token = AppSecureStorage.getToken();
    // After you choose your token, you assign it to the request.
    options.headers['token'] = token;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    super.onResponse(response, handler);
  }
}
