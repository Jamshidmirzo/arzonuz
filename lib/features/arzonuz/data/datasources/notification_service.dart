import 'package:dio/dio.dart';

class NotificationService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<void> getAllNotification(String refreshToken) async {
    try {
      final url = '$baseUrl/notifications/all';
      await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
   Future<void> readNotification(String refreshToken) async {
    try {
      final url = '$baseUrl/notifications/unreaden';
      await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

}
