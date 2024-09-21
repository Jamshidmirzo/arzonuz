import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card.dart';
import 'package:arzonuz/features/arzonuz/card/data/repository/card_repository.dart';
import 'package:dartz/dartz.dart';

class CardGetUsecases extends Usecases<void, void> {
  CardRepositoryImpl cardRepositoryImpl;

  CardGetUsecases({required this.cardRepositoryImpl});

  @override
  Future<Either<Failure, List<CardModel>>> call( void params) async {
    return cardRepositoryImpl.getCard();
  }
}
