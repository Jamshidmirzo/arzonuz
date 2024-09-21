import 'dart:io';

import 'package:arzonuz/features/arzonuz/auth/data/model/update_profile_request.dart';
import 'package:arzonuz/features/arzonuz/auth/data/model/user_model.dart';
import 'package:arzonuz/features/arzonuz/auth/data/model/passwords/change_pass_request.dart';

import 'package:dio/dio.dart';

class UserService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8085';

  Future<void> changePassword(
      ChangePassRequest changePassRequest, String refreshToken) async {
    final String url = '$baseUrl/user/change-password';

    try {
      final response = await dio.post(
        url,
        data: changePassRequest.toMap(),
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
      } else {}
    } on DioException catch (dioError) {
      if (dioError.response != null) {
      } else {}
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUser(String refreshToken) async {
    final String url = '$baseUrl/user/profile';
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromMap(response.data);
      }
      if (response.statusCode == 500) {
        throw ('Serverda erroror');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {}
      rethrow;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> updateProfiel(
      UpdateProfileRequest updateProfileRequest, String refreshToken) async {
    final String url = '$baseUrl/user/profile';

    try {
      final response = await dio.put(
        url,
        data: updateProfileRequest.toMap(),
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {}
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePhoto(File file, String refreshToken) async {
    final String url = '$baseUrl/user/photo';

    try {
      // Create FormData with the file
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });

      // Post request to upload the file
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      // Handle the response
      if (response.statusCode == 200) {
      } else {}
    } on DioException catch (dioError) {
      if (dioError.response != null) {
      } else {}
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
