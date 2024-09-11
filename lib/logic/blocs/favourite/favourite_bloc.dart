import 'package:arzonuz/logic/blocs/favourite/favourite_event.dart';
import 'package:arzonuz/logic/blocs/favourite/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc()
      : super(
          const FavoriteState([]),
        ) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  Future<void> _onLoadFavorites(
      LoadFavorites event, Emitter<FavoriteState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favoriteProducts') ?? [];
    emit(FavoriteState(favorites));
  }

  Future<void> _onAddFavorite(
      AddFavorite event, Emitter<FavoriteState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = List<String>.from(state.favoriteProducts);

    if (!favorites.contains(event.productId)) {
      favorites.add(event.productId);
      await prefs.setStringList('favoriteProducts', favorites);
      emit(FavoriteState(favorites));
    }
  }

  Future<void> _onRemoveFavorite(
      RemoveFavorite event, Emitter<FavoriteState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = List<String>.from(state.favoriteProducts);

    if (favorites.contains(event.productId)) {
      favorites.remove(event.productId);
      await prefs.setStringList('favoriteProducts', favorites);
      emit(FavoriteState(favorites));
    }
  }
}
