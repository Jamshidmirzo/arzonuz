// ignore_for_file: must_be_immutable

part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardAdded extends CardState {}

final class CardNothing extends CardState {}


final class CardLoaded extends CardState {
  List<CardModel> cards;
  CardLoaded({required this.cards});
}

final class CardLoading extends CardState {}

final class CardError extends CardState {
  String message;
  CardError({required this.message});
}
