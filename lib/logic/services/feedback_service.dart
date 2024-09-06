import 'package:arzonuz/data/models/feedback/feedback_request.dart';
import 'package:dio/dio.dart';

class FeedbackService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<FeedbackRequest?> getFeedbacks(
      String refreshToken, String productId) async {
    print(productId);
    try {
      final url = '$baseUrl/feedback/$productId';
      final responce = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (responce.statusCode == 200) {
        return FeedbackRequest.fromMap(responce.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
