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

  _getCard(CardGetEvent event, emit) async {
    emit(CardLoading());
    try {
      final responce = await cardRepository.getCards();
      emit(
        CardLoaded(cards: responce!),
      );
    } catch (e) {
      emit(
        CardError(
          message: e.toString(),
        ),
      );
    }
  }
}
