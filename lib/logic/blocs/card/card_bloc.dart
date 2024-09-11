import 'package:arzonuz/data/models/card_models/card.dart';
import 'package:arzonuz/data/models/card_models/card_request.dart';
import 'package:arzonuz/logic/repositories/card_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardRepository cardRepository = CardRepository();
  CardBloc() : super(CardInitial()) {
    on<CardEvent>((event, emit) {});
    on<CardAddEvent>(_addCard);
    on<CardGetEvent>(_getCard);
    on<CardDeleteEvent>(_deleteCard);
  }
  _deleteCard(CardDeleteEvent event, emit) async {
    emit(CardLoading());
    try {
      cardRepository.deleteCard(event.cardId);
      emit(
        CardAdded(),
      );
    } catch (e) {
      emit(
        CardError(
          message: e.toString(),
        ),
      );
    }
  }

  _addCard(CardAddEvent event, emit) async {
    emit(CardLoading());
    try {
      await cardRepository.createCard(event.cardRequest);
      emit(
        CardAdded(),
      );
    } catch (e) {
      emit(
        CardError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _getCard(CardGetEvent event, emit) async {
    emit(CardLoading()); // Emit loading state

    try {
      final response = await cardRepository.getCards();

      // If the response contains cards, emit loaded state; otherwise, emit empty state
      if (response != null && response.isNotEmpty) {
        emit(CardLoaded(cards: response));
      } else {
        emit(CardNothing()); // Emit a specific state if no cards are found
      }
    } catch (e) {
      // Emit an error state with a more user-friendly message
      emit(CardError(message: "Failed to load cards. Please try again later."));
    }
  }
}
