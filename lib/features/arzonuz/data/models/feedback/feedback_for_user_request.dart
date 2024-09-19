// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackForUserRequest {
  String description;
  int rating;
  FeedbackForUserRequest({
    required this.description,
    required this.rating,
  });

  FeedbackForUserRequest copyWith({
    String? description,
    int? rating,
  }) {
    return FeedbackForUserRequest(
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'rating': rating,
    };
  }

  factory FeedbackForUserRequest.fromMap(Map<String, dynamic> map) {
    return FeedbackForUserRequest(
      description: map['description'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackForUserRequest.fromJson(String source) => FeedbackForUserRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FeedbackForUserRequest(description: $description, rating: $rating)';

  @override
  bool operator ==(covariant FeedbackForUserRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.rating == rating;
  }

  @override
  int get hashCode => description.hashCode ^ rating.hashCode;
}
