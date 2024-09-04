import 'package:arzonuz/data/models/forgot_pass_reeuqest.dart';
import 'package:arzonuz/data/models/login_request.dart';
import 'package:arzonuz/data/models/register_request.dart';
import 'package:dio/dio.dart';

class AuthService {
  final dio = Dio();
  final baseUrl = 'http://13.38.70.151:8085';

  Future<String> register(RegisterRequest registerRequest) async {
    try {
      final url = '$baseUrl/auth/register';
      final responce = await dio.post(
        url,
        data: registerRequest.toMap(),
      );
      return responce.data['id'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logIn(LoginRequest loginRequest) async {
    try {
      final url = '$baseUrl/auth/login';
      final responce = await dio.post(url, data: loginRequest.toMap());
      return responce.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword(String email) async {
    Map<String, String> data = {"email": email};
    try {
      final url = '$baseUrl/auth/forgot-password';

      final response = await dio.post(url, data: data);

      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword(ForgotPassRequest forgotPassRequest) async {
    try {
      final url = '$baseUrl/auth/reset-password';
      await dio.post(
        url,
        data: forgotPassRequest.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {}
}
