import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  final List<String> favoriteProducts;

  const FavoriteState(this.favoriteProducts);

  @override
  List<Object> get props => [favoriteProducts];
}
