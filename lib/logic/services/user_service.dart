import 'dart:io';

import 'package:arzonuz/data/models/change_pass_request.dart';
import 'package:arzonuz/data/models/update_profile_request.dart';
import 'package:arzonuz/data/models/user_model.dart';
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
      print(response.data);
      if (response.statusCode == 200) {
        return UserModel.fromMap(response.data);
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

    print('FIELELLEELE"$file');
    try {
      final response = await dio.post(
        url,
        data: file,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      // Handle the response
      if (response.statusCode == 200) {
        print('File uploaded successfully: ${response.data}');
      } else {
        print(
            'Failed to upload file: ${response.statusCode} ${response.statusMessage}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print(
            'DioError: ${dioError.response?.statusCode} ${dioError.response?.data}');
      } else {
        print('DioError: $dioError');
      }
      rethrow;
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }
}
