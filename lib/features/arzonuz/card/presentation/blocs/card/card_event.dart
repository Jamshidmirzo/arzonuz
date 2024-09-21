// ignore_for_file: must_be_immutable

part of 'card_bloc.dart';

@freezed
class CardEvent with _$CardEvent {
  factory CardEvent.cardAddEvent(CardRequest cardRequest) = _CardAddEvent;
  factory CardEvent.cardGetEvent() = _CardGetEvent;
  factory CardEvent.carddeleteEvent(String cardId) = _CardDeleteEvent;

}

