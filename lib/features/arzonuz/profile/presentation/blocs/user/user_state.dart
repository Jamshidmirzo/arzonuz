part of 'user_bloc.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserError extends UserState {
  String message;
  UserError({required this.message});
}

final class UserChangedPass extends UserState {}

final class UserLoading extends UserState {}

final class UserUpdatePhoto extends UserState {}


final class UserUpdated extends UserState {}

final class UserLoaded extends UserState {
  UserModel user;
  UserLoaded({required this.user});
}
