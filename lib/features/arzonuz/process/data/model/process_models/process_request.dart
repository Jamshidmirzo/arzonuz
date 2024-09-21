// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ProcessRequest {
  int amount;
  String card_number;
  String product_id;
  ProcessRequest({
    required this.amount,
    required this.card_number,
    required this.product_id,
  });
  

  ProcessRequest copyWith({
    int? amount,
    String? card_number,
    String? product_id,
  }) {
    return ProcessRequest(
      amount: amount ?? this.amount,
      card_number: card_number ?? this.card_number,
      product_id: product_id ?? this.product_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'card_number': card_number,
      'product_id': product_id,
    };
  }

  factory ProcessRequest.fromMap(Map<String, dynamic> map) {
    return ProcessRequest(
      amount: map['amount'] as int,
      card_number: map['card_number'] as String,
      product_id: map['product_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProcessRequest.fromJson(String source) => ProcessRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProcessRequest(amount: $amount, card_number: $card_number, product_id: $product_id)';

  @override
  bool operator ==(covariant ProcessRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.amount == amount &&
      other.card_number == card_number &&
      other.product_id == product_id;
  }

  @override
  int get hashCode => amount.hashCode ^ card_number.hashCode ^ product_id.hashCode;
}
