part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class FeedbackGetAll extends FeedbackEvent {
  String productId;
  FeedbackGetAll({required this.productId});
}
