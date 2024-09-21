part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductErrorState extends ProductState {
  String message;
  ProductErrorState({required this.message});
}

class ProductLoadingState extends ProductState {}

class ProductGetProductsState extends ProductState {
  List<Product> products;
  ProductGetProductsState({required this.products});
}
class ProductGetWishlistProductsState extends ProductState {
   List<Product> products;
  
  ProductGetWishlistProductsState({required this.products});
}

class ProductGetAllProductsState extends ProductState {
  List<Product> products;

  ProductGetAllProductsState({required this.products});
}
class ProductNoProductsState extends ProductState{}

class ProductAddedState extends ProductState {}

class ProductDeletedState extends ProductState {}

