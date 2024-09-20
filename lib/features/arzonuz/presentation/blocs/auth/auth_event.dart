// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authLogout() = AuthLogoutEvent;
  const factory AuthEvent.authRegister(AuthRegisterParams registerRequest) =
      _AuthRegisterEvent;
  const factory AuthEvent.authReset(ResetPassRequestParams forgotPassRequest) =
      _AuthResetEvent;
  const factory AuthEvent.authForgot(AuthForgotParams email) = AuthForgotEvent;
  const factory AuthEvent.authLogin(AuthLoginParams loginRequest) =
      _AuthLoginrEvent;
  const factory AuthEvent.authCheck(
      final String? refreshToken, final String? userId) = _AuthCheckStatusEvent;
}















// class AuthRegisterEvent extends AuthEvent {
//   RegisterRequest registerRequest;
//   AuthRegisterEvent({
//     required this.registerRequest,
//   });
// }

// class AuthLogoutEvent extends AuthEvent {}

// class AuthForgotEvent extends AuthEvent {
//   String email;
//   AuthForgotEvent({required this.email});
// }

// class AuthResetEvent extends AuthEvent {
//   ForgotPassRequest forgotPassRequest;
//   AuthResetEvent({required this.forgotPassRequest});
// }

// class AuthLoginrEvent extends AuthEvent {
//   LoginRequest loginRequest;
//   AuthLoginrEvent({
//     required this.loginRequest,
//   });
// }

// class AuthCheckStatusEvent extends AuthEvent {
//   final String? refreshToken;
//   final String? userId;
//   AuthCheckStatusEvent({required this.refreshToken, required this.userId});
// }
