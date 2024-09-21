import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_add_usecases.dart';
import 'package:arzonuz/features/arzonuz/card/domain/card_usecases/card_delete_usecases.dart';
import 'package:dartz/dartz.dart';

abstract class CardRepositories {
  Future<Either<Failure, void>> deleteCard(DeleteCardParams params);
  Future<Either<Failure, void>> addCard(AddCardParams params);
  Future<Either<Failure, List<CardModel>>> getCard();
}
