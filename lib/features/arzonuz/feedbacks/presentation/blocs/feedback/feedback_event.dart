part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

// ignore: must_be_immutable
class FeedbackGetAll extends FeedbackEvent {
  String productId;
  FeedbackGetAll({required this.productId});
}
