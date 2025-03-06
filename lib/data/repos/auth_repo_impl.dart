import 'package:ecommerce_app/api/model/requests/login_request.dart';
import 'package:ecommerce_app/api/model/response/auth_response/auth_response.dart';
import 'package:ecommerce_app/data/dataSource/auth_online_data_source.dart';
import 'package:ecommerce_app/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthOnlineDataSource _authOnlineDataSource;

  AuthRepoImpl(this._authOnlineDataSource);
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return _authOnlineDataSource.login(loginRequest);
  }
}
