import 'package:arzonuz/core/constants/constants.dart';
import 'package:arzonuz/core/error/exception.dart';
import 'package:arzonuz/core/error/failure.dart';
import 'package:arzonuz/features/arzonuz/card/data/model/card_request.dart';
import 'package:dio/dio.dart';

class CardDatasources {
  Dio dio;
  CardDatasources({
    required this.dio,
  });
  Future<void> createCard(CardRequest cardRequest, String refreshToken) async {
    try {
      final url = '$baseUrl8080/cards';
      await dio.post(
        url,
        data: cardRequest.toJson(),
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException {
      throw ServerExeption();
    } on ServerExeption {
      ServerFailure();
    }
  }

  Future<Map<String, dynamic>?> getCards(String refreshToken) async {
    try {
      final url = '$baseUrl8080/cards';
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return response.data;
      } else {}
    } on ServerExeption {
      rethrow;
    }
    return null;
  }

  Future<void> removeCard(String refreshToken, String cardId) async {
    try {
      final url = '$baseUrl8080/cards/$cardId';
      await dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException {
      rethrow;
    } on ServerExeption {
      rethrow;
    }
  }
}
