import 'package:arzonuz/data/models/card_request.dart';
import 'package:dio/dio.dart';

class CardService {
  final Dio dio = Dio();
  final String baseUrl = 'http://13.38.70.151:8080';

  Future<void> createCard(CardRequest cardRequest, String refreshToken) async {
    try {
      final url = '$baseUrl/cards';
      await dio.post(
        url,
        data: cardRequest.toMap(),
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getCards(String refreshToken) async {
    try {
      final url = '$baseUrl/cards';
      final responce = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (responce.statusCode == 200) {
        return responce.data;
      }
      print(responce.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
