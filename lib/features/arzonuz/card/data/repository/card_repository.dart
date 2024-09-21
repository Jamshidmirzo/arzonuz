import 'package:arzonuz/core/error/exception.dart';
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/card/data/datasources/card_datasources.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card.dart';
import 'package:arzonuz/features/arzonuz/card/domain/repositories/card_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardRepositoryImpl extends CardRepositories {
  CardDatasources cardDatasources;
  SharedPreferences shared;
  CardRepositoryImpl({required this.cardDatasources, required this.shared});
  @override
  Future<Either<Failure, void>> addCard(params) async {
    String? refreshToken = shared.getString('refreshToken');
    if (refreshToken != null) {
      return await (_addCard(
        () => cardDatasources.createCard(params.cardRequest, refreshToken),
      ));
    }
    return Left(CacheFailure());
  }

  @override
  Future<Either<Failure, void>> deleteCard(params) async {
    String? refreshToken = shared.getString('refreshToken');
    if (refreshToken != null) {
      return await (_deleteCard(
        () => cardDatasources.removeCard(
          refreshToken,
          params.cardId,
        ),
      ));
    }
    return Left(
      CacheFailure(),
    );
  }

  @override
  Future<Either<Failure, List<CardModel>>> getCard() async {
    String? refreshToken = shared.getString('refreshToken');
    if (refreshToken != null) {
      return await _getCard(
        () => cardDatasources.getCards(refreshToken),
      );
    }
    return Left(
      ServerFailure(),
    );
  }

  Future<Either<Failure, void>> _addCard(
      Future<void> Function() addCard) async {
    try {
      return Right(await addCard());
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<CardModel>>> _getCard(
      Future<Map<String, dynamic>?> Function() getCard) async {
    try {
      final response = await getCard();

      if (response != null && response['cards'] != null) {
        return Right(
          (response['cards'] as List)
              .map((element) => CardModel.fromJson(element))
              .toList(),
        );
      } else {
        return Left(ServerFailure());
      }
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, void>> _deleteCard(
      Future<void> Function() deleteCard) async {
    try {
      return Right(await deleteCard());
    } on ServerExeption {
      return Left(
        ServerFailure(),
      );
    }
  }
}
