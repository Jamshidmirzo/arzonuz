part of 'auth_bloc.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthicated extends AuthState {}

final class AuthUnuthicated extends AuthState {}

final class AuthSuccesifullyReset extends AuthState {}


// ignore: must_be_immutable
final class AuthError extends AuthState {
  String message;
  AuthError({required this.message});
}
