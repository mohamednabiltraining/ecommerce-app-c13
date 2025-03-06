import 'package:ecommerce_app/api/model/requests/login_request.dart';
import 'package:ecommerce_app/api/model/response/auth_response/auth_response.dart';
import 'package:ecommerce_app/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);
  Future<AuthResponse> call(LoginRequest loginRequest) async {
    return await _authRepo.login(loginRequest);
  }
}
