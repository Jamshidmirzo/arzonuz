import 'package:arzonuz/data/models/card_models/card_request.dart';
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
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': refreshToken,
          'Content-Type': 'application/json',
        },
      ),
    );

    // Handle HTTP response status code
    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return response.data;  // Return valid data
    } else {
      return null;  // Return null for unexpected responses
    }
  } on DioException catch (dioError) {
    // Log Dio error details, but avoid exposing to end-users
    print("DioError: ${dioError.message}");
    rethrow;  // Re-throw to be caught by the repository or BLoC
  } catch (e) {
    // Handle unexpected errors
    print("Error: $e");
    rethrow;
  }
}


  Future<void> removeCard(String refreshToken, String cardId) async {
    try {
      final url = '$baseUrl/cards/$cardId';
      final responce = await dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': refreshToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      print(responce.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
