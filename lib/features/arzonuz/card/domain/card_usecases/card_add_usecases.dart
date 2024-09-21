// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/card/domain/repositories/card_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:arzonuz/core/usecases/usecases.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card_request.dart';

class CardAddUsecases extends Usecases<void, AddCardParams> {
  CardRepositories cardRepositories;
  CardAddUsecases({
    required this.cardRepositories,
  });
  @override
  Future<Either<Failure,void>> call(AddCardParams params) {
    return cardRepositories.addCard(params);
  }
}

class AddCardParams extends Equatable {
  final CardRequest cardRequest;
  const AddCardParams({
    required this.cardRequest,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
