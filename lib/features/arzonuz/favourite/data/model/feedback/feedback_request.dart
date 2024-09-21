// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:arzonuz/features/arzonuz/favourite/data/model/feedback/feedback.dart';

class FeedbackRequest {
  String average_rating;
  FeedbackModel feedback;
  FeedbackRequest({
    required this.average_rating,
    required this.feedback,
  });

  FeedbackRequest copyWith({
    String? average_rating,
    FeedbackModel? feedback,
  }) {
    return FeedbackRequest(
      average_rating: average_rating ?? this.average_rating,
      feedback: feedback ?? this.feedback,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'average_rating': average_rating,
      'feedback': feedback.toMap(),
    };
  }

  factory FeedbackRequest.fromMap(Map<String, dynamic> map) {
    return FeedbackRequest(
      average_rating: map['average_rating'] as String,
      feedback: FeedbackModel.fromMap(map['feedback'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackRequest.fromJson(String source) =>
      FeedbackRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FeedbackRequest(average_rating: $average_rating, feedback: $feedback)';

  @override
  bool operator ==(covariant FeedbackRequest other) {
    if (identical(this, other)) return true;

    return other.average_rating == average_rating && other.feedback == feedback;
  }

  @override
  int get hashCode => average_rating.hashCode ^ feedback.hashCode;
}
