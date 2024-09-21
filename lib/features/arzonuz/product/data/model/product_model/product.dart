// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  String id;
  String name;
  List color;
  String description;
  int price;
  String end_date;
  int stock;
  int limit_of_product;
  List photos;
  int price_without_stock;
  String seller_id;
  List size;
  String start_date;
  Product({
    required this.color,
    required this.description,
    required this.end_date,
    required this.id,
    required this.limit_of_product,
    required this.name,
    required this.photos,
    required this.price,
    required this.price_without_stock,
    required this.seller_id,
    required this.size,
    required this.start_date,
    required this.stock,
  });

  Product copyWith({
    List? color,
    String? description,
    String? end_date,
    String? id,
    int? limit_of_product,
    String? name,
    List? photos,
    int? price,
    int? price_without_stock,
    String? seller_id,
    List? size,
    String? start_date,
    int? stock,
  }) {
    return Product(
      color: color ?? this.color,
      description: description ?? this.description,
      end_date: end_date ?? this.end_date,
      id: id ?? this.id,
      limit_of_product: limit_of_product ?? this.limit_of_product,
      name: name ?? this.name,
      photos: photos ?? this.photos,
      price: price ?? this.price,
      price_without_stock: price_without_stock ?? this.price_without_stock,
      seller_id: seller_id ?? this.seller_id,
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
      'id': id,
      'limit_of_product': limit_of_product,
      'name': name,
      'photos': photos,
      'price': price,
      'price_without_stock': price_without_stock,
      'seller_id': seller_id,
      'size': size,
      'start_date': start_date,
      'stock': stock,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
  return Product(
    color: List<String>.from(map['color'] ?? []), // Explicitly cast to List<String>
    description: map['description'] as String,
    end_date: map['end_date'] as String,
    id: map['id'] as String,
    limit_of_product: (map['limit_of_product'] as num?)?.toInt() ?? 0,
    name: map['name'] as String,
    photos: List<String>.from(map['photos'] ?? []), // Explicitly cast to List<String>
    price: (map['price'] as num?)?.toInt() ?? 0,
    price_without_stock: (map['price_without_stock'] as num?)?.toInt() ?? 0,
    seller_id: map['seller_id'] as String,
    size: List<String>.from(map['size'] ?? []), // Explicitly cast to List<String>
    start_date: map['start_date'] as String,
    stock: (map['stock'] as num?)?.toInt() ?? 0,
  );
}

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(color: $color, description: $description, end_date: $end_date, id: $id, limit_of_product: $limit_of_product, name: $name, photos: $photos, price: $price, price_without_stock: $price_without_stock, seller_id: $seller_id, size: $size, start_date: $start_date, stock: $stock)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return listEquals(other.color, color) &&
        other.description == description &&
        other.end_date == end_date &&
        other.id == id &&
        other.limit_of_product == limit_of_product &&
        other.name == name &&
        listEquals(other.photos, photos) &&
        other.price == price &&
        other.price_without_stock == price_without_stock &&
        other.seller_id == seller_id &&
        listEquals(other.size, size) &&
        other.start_date == start_date &&
        other.stock == stock;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        description.hashCode ^
        end_date.hashCode ^
        id.hashCode ^
        limit_of_product.hashCode ^
        name.hashCode ^
        photos.hashCode ^
        price.hashCode ^
        price_without_stock.hashCode ^
        seller_id.hashCode ^
        size.hashCode ^
        start_date.hashCode ^
        stock.hashCode;
  }
}
