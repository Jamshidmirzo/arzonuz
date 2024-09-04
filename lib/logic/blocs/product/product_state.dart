part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductErrorState extends ProductState {
  String message;
  ProductErrorState({required this.message});
}

class ProductLoadingState extends ProductState {}

class ProductAddedState extends ProductState {}
