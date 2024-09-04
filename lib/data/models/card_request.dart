// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CardRequest {
  String card_number;
  String ccv;
  String expiration_date;
  CardRequest({
    required this.card_number,
    required this.ccv,
    required this.expiration_date,
  });

  CardRequest copyWith({
    String? card_number,
    String? ccv,
    String? expiration_date,
  }) {
    return CardRequest(
      card_number: card_number ?? this.card_number,
      ccv: ccv ?? this.ccv,
      expiration_date: expiration_date ?? this.expiration_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'card_number': card_number,
      'ccv': ccv,
      'expiration_date': expiration_date,
    };
  }

  factory CardRequest.fromMap(Map<String, dynamic> map) {
    return CardRequest(
      card_number: map['card_number'] as String,
      ccv: map['ccv'] as String,
      expiration_date: map['expiration_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardRequest.fromJson(String source) =>
      CardRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CardRequest(card_number: $card_number, ccv: $ccv, expiration_date: $expiration_date)';

  @override
  bool operator ==(covariant CardRequest other) {
    if (identical(this, other)) return true;

    return other.card_number == card_number &&
        other.ccv == ccv &&
        other.expiration_date == expiration_date;
  }

  @override
  int get hashCode =>
      card_number.hashCode ^ ccv.hashCode ^ expiration_date.hashCode;
}
