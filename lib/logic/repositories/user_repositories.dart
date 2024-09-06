import 'dart:io';

import 'package:arzonuz/data/models/passwords/change_pass_request.dart';
import 'package:arzonuz/data/models/auth_models/update_profile_request.dart';
import 'package:arzonuz/logic/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositories {
  UserService userService = UserService();

  changePassword(ChangePassRequest changePassRequest) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return userService.changePassword(changePassRequest, refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }

  getUser() async {
    print('Repo kriididd');
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken =  shared.getString('refreshToken');
      print(refreshToken);
      if (refreshToken != null) {
        print('BLocda kriididd 2');
        return userService.getUser(refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }

  updateProfile(UpdateProfileRequest updateProfileRequest) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return userService.updateProfiel(updateProfileRequest, refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }

  updatePhoto(File file) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return userService.updatePhoto(file, refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }
}
