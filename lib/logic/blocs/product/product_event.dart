// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';


sealed class ProductEvent {}

class ProductAddEvent extends ProductEvent {
  ProductResponce productResponce;
  ProductAddEvent({required this.productResponce});
}
