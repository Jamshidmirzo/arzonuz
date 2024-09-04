// ignore_for_file: must_be_immutable

part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

class CardAddEvent extends CardEvent {
  CardRequest cardRequest;
  CardAddEvent({required this.cardRequest});
}

class CardGetEvent extends CardEvent {}
