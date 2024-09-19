part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackLoading extends FeedbackState {}

final class FeedbackError extends FeedbackState {
  String message;
  FeedbackError({required this.message});
}

final class FeedbackLoaded extends FeedbackState {
  FeedbackRequest? feedbackRequest;
  FeedbackLoaded({required this.feedbackRequest});
}
