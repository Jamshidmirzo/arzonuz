part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}


class NotificationGetAllEvent extends NotificationEvent{}


class NotificationReadEvent extends NotificationEvent{}
