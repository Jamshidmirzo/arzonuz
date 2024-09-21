part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackLoading extends FeedbackState {}

// ignore: must_be_immutable
final class FeedbackError extends FeedbackState {
  String message;
  FeedbackError({required this.message});
}

// ignore: must_be_immutable
final class FeedbackLoaded extends FeedbackState {
  FeedbackRequest? feedbackRequest;
  FeedbackLoaded({required this.feedbackRequest});
}
