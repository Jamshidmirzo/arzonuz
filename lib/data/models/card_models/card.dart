// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CardModel {
  String card_number;
  String expiration_date;
  String user_id;
  String card_type;
  String id;
  CardModel({
    required this.card_number,
    required this.expiration_date,
    required this.user_id,
    required this.card_type,
    required this.id,
  });

  CardModel copyWith({
    String? card_number,
    String? expiration_date,
    String? user_id,
    String? card_type,
    String? id,
  }) {
    return CardModel(
      card_number: card_number ?? this.card_number,
      expiration_date: expiration_date ?? this.expiration_date,
      user_id: user_id ?? this.user_id,
      card_type: card_type ?? this.card_type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'card_number': card_number,
      'expiration_date': expiration_date,
      'user_id': user_id,
      'card_type': card_type,
      'id': id,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      card_number: map['card_number'] as String,
      expiration_date: map['expiration_date'] as String,
      user_id: map['user_id'] as String,
      card_type: map['card_type'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardModel(card_number: $card_number, expiration_date: $expiration_date, user_id: $user_id, card_type: $card_type, id: $id)';
  }

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;

    return other.card_number == card_number &&
        other.expiration_date == expiration_date &&
        other.user_id == user_id &&
        other.card_type == card_type &&
        other.id == id;
  }

  @override
  int get hashCode {
    return card_number.hashCode ^
        expiration_date.hashCode ^
        user_id.hashCode ^
        card_type.hashCode ^
        id.hashCode;
  }
}
