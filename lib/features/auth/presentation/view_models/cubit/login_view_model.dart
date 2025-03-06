import 'package:ecommerce_app/api/model/requests/login_request.dart';
import 'package:ecommerce_app/api/model/response/auth_response/auth_response.dart';
import 'package:ecommerce_app/domain/use_case/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase) : super(LoginViewModelInitial());

  login(LoginRequest loginRequest) async {
    emit(LoginViewModelLoading());
    try {
      var result = await _loginUseCase(loginRequest);
      if (result.token?.isNotEmpty ?? false) {
        emit(LoginViewModelSuccess(result));
      } else {
        emit(LoginViewModelError());
      }
    } catch (e) {
      emit(LoginViewModelError());
    }
  }
}
