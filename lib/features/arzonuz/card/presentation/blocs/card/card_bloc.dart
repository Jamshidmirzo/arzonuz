import 'package:arzonuz/core/constants/constants.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card_request.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_add_usecases.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_delete_usecases.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_get_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_event.dart';
part 'card_state.dart';
part 'card_bloc.freezed.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardAddUsecases cardAddUsecases;
  CardDeleteUsecases cardDeleteUsecases;
  CardGetUsecases cardGetUsecases;
  CardBloc(
      {required this.cardAddUsecases,
      required this.cardDeleteUsecases,
      required this.cardGetUsecases})
      : super(CardState(status: StatusCard.LOADING)) {
    on<CardEvent>((event, emit) {});
    on<_CardAddEvent>(_addCard);
    on<_CardGetEvent>(_getCard);
    on<_CardDeleteEvent>(_deleteCard);
  }
  Future<void> _deleteCard(_CardDeleteEvent event, emit) async {
    emit(StatusCard.LOADING);
    try {
      cardDeleteUsecases(
        DeleteCardParams(cardId: event.cardId),
      );
      emit(
        StatusCard.SUCCESS,
      );
    } catch (e) {
      emit(
        StatusCard.ERROR,
        message: e.toString(),
      );
    }
  }

  Future<void> _addCard(_CardAddEvent event, emit) async {
    emit(state.status);
    try {
      await cardAddUsecases(
        AddCardParams(cardRequest: event.cardRequest),
      );
      emit(
        StatusCard.SUCCESS,
      );
    } catch (e) {
      emit(
        StatusCard.ERROR,
        message: e.toString(),
      );
    }
  }

  Future<void> _getCard(_CardGetEvent event, emit) async {
    emit(StatusCard.LOADING);
    // ignore: void_checks
    final response = await cardGetUsecases.call(() {});
    response.fold((error) {
      emit(StatusCard.ERROR);
    }, (data) {
      emit(cards: data, StatusCard.SUCCESS);
    });
  }
}
