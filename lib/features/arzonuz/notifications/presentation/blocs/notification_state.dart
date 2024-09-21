part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {}

// ignore: must_be_immutable
final class NotificationError extends NotificationState {
  String message;
  NotificationError({required this.message});
}
