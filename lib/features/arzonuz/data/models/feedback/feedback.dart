// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackModel {
  String description;
  String rating;
  String user_id;
  FeedbackModel({
    required this.description,
    required this.rating,
    required this.user_id,
  });
  

  FeedbackModel copyWith({
    String? description,
    String? rating,
    String? user_id,
  }) {
    return FeedbackModel(
      description: description ?? this.description,
      rating: rating ?? this.rating,
      user_id: user_id ?? this.user_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'rating': rating,
      'user_id': user_id,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      description: map['description'] as String,
      rating: map['rating'] as String,
      user_id: map['user_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackModel.fromJson(String source) => FeedbackModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FeedbackModel(description: $description, rating: $rating, user_id: $user_id)';

  @override
  bool operator ==(covariant FeedbackModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.description == description &&
      other.rating == rating &&
      other.user_id == user_id;
  }

  @override
  int get hashCode => description.hashCode ^ rating.hashCode ^ user_id.hashCode;
}
