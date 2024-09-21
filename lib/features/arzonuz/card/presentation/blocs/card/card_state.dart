// ignore_for_file: must_be_immutable

part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
factory CardState({
  String? message,
  List<CardModel>? cards,
  @Default(StatusCard.LOADING) StatusCard status,
})=_CardState;




  // factory CardState.initial() = CardInitial;
  // factory CardState.added() = CardAdded;
  // factory CardState.nothing() = CardNothing;
  // factory CardState.loading() = CardLoading;
  // factory CardState.error({required String message}) = CardError;
  // factory CardState.loaded({required List<CardModel> cards}) = CardLoaded;


}

