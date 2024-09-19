import 'package:arzonuz/features/arzonuz/data/models/card_models/card.dart';
import 'package:arzonuz/features/arzonuz/data/models/card_models/card_request.dart';
import 'package:arzonuz/features/arzonuz/data/datasources/card_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardRepository {
  CardService cardService = CardService();

  createCard(CardRequest cardRequest) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return cardService.createCard(cardRequest, refreshToken);
      }
    } catch (e) {
      rethrow;
    }
  }

  deleteCard(String cardId) async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        return cardService.removeCard(refreshToken, cardId);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CardModel>?> getCards() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');

      if (refreshToken == null) {
        return null;
      }

      final response = await cardService.getCards(refreshToken);

      if (response != null && response['cards'] != null) {
        return (response['cards'] as List)
            .map((element) => CardModel.fromMap(element))
            .toList();
      }
    } catch (e) {
      print("Repository Error: $e");
      rethrow;
    }
    return null;
  }
}
