import 'package:arzonuz/logic/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepository {
  NotificationService notificationService = NotificationService();

  getNotifications() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return notificationService.getAllNotification(refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }

  readNotifications() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return notificationService.readNotification(refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }
}
