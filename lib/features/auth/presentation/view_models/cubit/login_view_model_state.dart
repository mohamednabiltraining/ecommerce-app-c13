part of 'login_view_model.dart';

sealed class LoginViewModelState {}

final class LoginViewModelInitial extends LoginViewModelState {}

final class LoginViewModelLoading extends LoginViewModelState {}

final class LoginViewModelSuccess extends LoginViewModelState {
  final AuthResponse authResponse;
  LoginViewModelSuccess(this.authResponse);
}

final class LoginViewModelError extends LoginViewModelState {}
