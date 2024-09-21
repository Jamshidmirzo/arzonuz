import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback_for_user_request.dart';
import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback_request.dart';
import 'package:dio/dio.dart';

class FeedbackDatasource {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<FeedbackRequest?> getFeedbacks(
      String refreshToken, String productId) async {
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

  Future<void> postFeedback(FeedbackForUserRequest feedbackUserRequest,
      String refreshToken, String productId) async {
    try {
      final url = '$baseUrl/feedback/$productId';
       await dio.post(
        url,
        data: feedbackUserRequest.toMap(),
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
