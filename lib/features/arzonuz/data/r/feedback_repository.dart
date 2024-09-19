import 'package:arzonuz/features/arzonuz/data/models/feedback/feedback_request.dart';
import 'package:arzonuz/features/arzonuz/data/datasources/feedback_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackRepository {
  FeedbackService feedbackService = FeedbackService();

  Future<FeedbackRequest?> getFeedbacks(String productId) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce =
            await feedbackService.getFeedbacks(refreshToken, productId);
        print('repoooooooo');
        print(responce);
        return responce;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
