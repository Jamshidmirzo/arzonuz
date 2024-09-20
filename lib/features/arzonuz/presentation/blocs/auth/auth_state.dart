part of 'auth_bloc.dart';

// ignore: constant_identifier_names, camel_case_types
enum Status { ERROR, LOADING, SUCCESS, AUTHICATED, UNAUTHICATED}
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    String? message,
    @Default(Status.LOADING) Status status,
  }) = _AuthState;

}

// final class AuthInitial extends AuthState {}

// final class AuthLoading extends AuthState {}

// final class AuthAuthicated extends AuthState {}

// final class AuthUnuthicated extends AuthState {}

// final class AuthSuccesifullyReset extends AuthState {}

// // ignore: must_be_immutable
// final class AuthError extends AuthState {
//   String message;
//   AuthError({required this.message});
// }
