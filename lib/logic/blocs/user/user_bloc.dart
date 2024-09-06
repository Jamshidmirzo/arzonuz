import 'dart:io';

import 'package:arzonuz/data/models/passwords/change_pass_request.dart';
import 'package:arzonuz/data/models/auth_models/update_profile_request.dart';
import 'package:arzonuz/data/models/auth_models/user_model.dart';
import 'package:arzonuz/logic/repositories/user_repositories.dart';
import 'package:bloc/bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepositories userRepositories = UserRepositories();
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UserChangePassEvent>(_changePass);
    on<UserGetUserEvent>(_getUser);
    on<UserUpdateUserEvent>(_updateUser);
    on<UserUpdatePhotoEvent>(_updatePhoto);
  }

  _updatePhoto(UserUpdatePhotoEvent event, emit) async {
    try {
      emit(UserLoading());
      await userRepositories.updatePhoto(event.file);
      emit(
        UserUpdatePhoto(),
      );
    } catch (e) {
      emit(
        UserError(
          message: e.toString(),
        ),
      );
    }
  }

  _updateUser(UserUpdateUserEvent event, emit) async {
    try {
      emit(UserLoading());
      await userRepositories.updateProfile(event.updateProfileRequest);
      emit(UserUpdated());
    } catch (e) {
      emit(
        UserError(
          message: e.toString(),
        ),
      );
    }
  }

  _changePass(UserChangePassEvent event, emit) async {
    try {
      emit(UserLoading());
      await userRepositories.changePassword(event.changePassRequest);
      emit(UserChangedPass());
    } catch (e) {
      emit(
        UserError(
          message: e.toString(),
        ),
      );
    }
  }

  _getUser(UserGetUserEvent event, emit) async {
    print('BLocda kriididd');
    try {
      emit(UserLoading());
      final UserModel user = await userRepositories.getUser();
      emit(
        UserLoaded(user: user),
      );
    } catch (e) {
      emit(
        UserError(
          message: e.toString(),
        ),
      );
    }
  }
}
