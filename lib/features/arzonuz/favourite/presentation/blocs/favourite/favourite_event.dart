import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFavorite extends FavoriteEvent {
  final String productId;

  AddFavorite(this.productId);

  @override
  List<Object> get props => [productId];
}

class RemoveFavorite extends FavoriteEvent {
  final String productId;

  RemoveFavorite(this.productId);

  @override
  List<Object> get props => [productId];
}

class LoadFavorites extends FavoriteEvent {}
