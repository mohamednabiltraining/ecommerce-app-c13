import 'package:ecommerce_app/api/WebServices.dart';
import 'package:ecommerce_app/api/model/requests/login_request.dart';
import 'package:ecommerce_app/api/model/response/auth_response/auth_response.dart';
import 'package:ecommerce_app/data/dataSource/auth_online_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceIml implements AuthOnlineDataSource {
  final WebServices _webServices;

  AuthOnlineDataSourceIml(this._webServices);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return _webServices.login(loginRequest);
  }
}
