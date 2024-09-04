part of 'user_bloc.dart';

sealed class UserEvent {}

class UserChangePassEvent extends UserEvent {
  ChangePassRequest changePassRequest;
  UserChangePassEvent({required this.changePassRequest});
}

class UserGetUserEvent extends UserEvent {}

class UserUpdatePhotoEvent extends UserEvent {
  File file;
  UserUpdatePhotoEvent({required this.file});
}

class UserUpdateUserEvent extends UserEvent {
  UpdateProfileRequest updateProfileRequest;
  UserUpdateUserEvent({required this.updateProfileRequest});
}








