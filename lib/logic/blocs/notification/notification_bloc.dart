import 'package:arzonuz/logic/repositories/notification_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationRepository notificationRepository = NotificationRepository();
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});
    on<NotificationGetAllEvent>(_getAll);
    on<NotificationReadEvent>(_readNotification);
  }

  _getAll(NotificationGetAllEvent event, emit) async {
    emit(NotificationLoading());
    try {
      await notificationRepository.getNotifications();
      emit(NotificationLoaded());
    } catch (e) {
      emit(
        NotificationError(message: e.toString()),
      );
    }
  }

  _readNotification(NotificationReadEvent event, emit) async {
    emit(NotificationLoading());
    try {
      await notificationRepository.readNotifications();
      emit(
        NotificationLoaded(),
      );
    } catch (e) {
      emit(
        NotificationError(
          message: e.toString(),
        ),
      );
    }
  }
}
