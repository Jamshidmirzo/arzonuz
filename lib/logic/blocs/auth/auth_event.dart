// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  RegisterRequest registerRequest;
  AuthRegisterEvent({
    required this.registerRequest,
  });
}

class AuthLogoutEvent extends AuthEvent {}

class AuthForgotEvent extends AuthEvent {
  String email;
  AuthForgotEvent({required this.email});
}

class AuthResetEvent extends AuthEvent {
  ForgotPassRequest forgotPassRequest;
  AuthResetEvent({required this.forgotPassRequest});
}

class AuthLoginrEvent extends AuthEvent {
  LoginRequest loginRequest;
  AuthLoginrEvent({
    required this.loginRequest,
  });
}

class AuthCheckStatusEvent extends AuthEvent {
  final String? refreshToken;
  final String? userId;
  AuthCheckStatusEvent({required this.refreshToken, required this.userId});
}
