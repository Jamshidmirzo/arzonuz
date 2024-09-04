import 'package:arzonuz/data/models/card.dart';
import 'package:arzonuz/data/models/card_request.dart';
import 'package:arzonuz/logic/services/card_service.dart';
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

  Future<List<CardModel>?> getCards() async {
    try {
      final shared = await SharedPreferences.getInstance();
      String? refreshToken = shared.getString('refreshToken');
      if (refreshToken != null) {
        final responce = await cardService.getCards(refreshToken);
        List<CardModel> cards = [];
        for (var element in responce!['cards']) {
          cards.add(
            CardModel.fromMap(element),
          );
        }
        return cards;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
