// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/card/data/repository/card_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:arzonuz/core/usecases/usecases.dart';

class CardDeleteUsecases extends Usecases<void, DeleteCardParams> {
  CardRepositoryImpl cardRepositoryImpl;
  CardDeleteUsecases({required this.cardRepositoryImpl});
  @override
  Future<Either<Failure,void>> call(params) {
    return cardRepositoryImpl.deleteCard(params);
  }
}

// ignore: must_be_immutable
class DeleteCardParams extends Equatable {
  String cardId;
  DeleteCardParams({
    required this.cardId,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
