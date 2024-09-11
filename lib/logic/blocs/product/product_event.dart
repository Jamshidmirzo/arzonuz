// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';

sealed class ProductEvent {}

class ProductAddEvent extends ProductEvent {
  ProductResponce productResponce;
  ProductAddEvent({required this.productResponce});
}

class ProductGetMyProductsEvent extends ProductEvent {}

class ProductGetWishlistProductsEvent extends ProductEvent {}


class ProductAddtoWishlistEvent extends ProductEvent {
  String productId;
  ProductAddtoWishlistEvent({required this.productId});
}

class ProductAddtoSharedWishlistEvent extends ProductEvent {
  String productId;
  ProductAddtoSharedWishlistEvent({required this.productId});
}

class ProductGetAllProductsEvent extends ProductEvent {}
