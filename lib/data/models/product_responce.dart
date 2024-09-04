// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductResponce {
  List color;
  String description;
  String end_date;
  String limit_of_product;
  String name;
  List size;
  String start_date;
  int stock;
  ProductResponce({
    required this.color,
    required this.description,
    required this.end_date,
    required this.limit_of_product,
    required this.name,
    required this.size,
    required this.start_date,
    required this.stock,
  });

  ProductResponce copyWith({
    List? color,
    String? description,
    String? end_date,
    String? limit_of_product,
    String? name,
    List? size,
    String? start_date,
    int? stock,
  }) {
    return ProductResponce(
      color: color ?? this.color,
      description: description ?? this.description,
      end_date: end_date ?? this.end_date,
      limit_of_product: limit_of_product ?? this.limit_of_product,
      name: name ?? this.name,
      size: size ?? this.size,
      start_date: start_date ?? this.start_date,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'description': description,
      'end_date': end_date,
      'limit_of_product': limit_of_product,
      'name': name,
      'size': size,
      'start_date': start_date,
      'stock': stock,
    };
  }

  factory ProductResponce.fromMap(Map<String, dynamic> map) {
    return ProductResponce(
      color: List.from(
        (map['color'] as List),
      ),
      description: map['description'] as String,
      end_date: map['end_date'] as String,
      limit_of_product: map['limit_of_product'] as String,
      name: map['name'] as String,
      size: List.from(
        (map['size'] as List),
      ),
      start_date: map['start_date'] as String,
      stock: map['stock'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponce.fromJson(String source) =>
      ProductResponce.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductResponce(color: $color, description: $description, end_date: $end_date, limit_of_product: $limit_of_product, name: $name, size: $size, start_date: $start_date, stock: $stock)';
  }

  @override
  bool operator ==(covariant ProductResponce other) {
    if (identical(this, other)) return true;

    return listEquals(other.color, color) &&
        other.description == description &&
        other.end_date == end_date &&
        other.limit_of_product == limit_of_product &&
        other.name == name &&
        listEquals(other.size, size) &&
        other.start_date == start_date &&
        other.stock == stock;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        description.hashCode ^
        end_date.hashCode ^
        limit_of_product.hashCode ^
        name.hashCode ^
        size.hashCode ^
        start_date.hashCode ^
        stock.hashCode;
  }
}
