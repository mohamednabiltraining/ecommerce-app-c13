import 'package:ecommerce_app/api/model/requests/login_request.dart';
import 'package:ecommerce_app/api/model/response/auth_response/auth_response.dart';

abstract class AuthOnlineDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);
}
