import 'package:braeking_bad/data/models/character_model.dart';
import 'package:braeking_bad/data/web_service/characyetr_web_service.dart';

import '../models/char_qoutes.dart';

class CharacterRepositry {
  final CharacterWebService characterWebService;
  CharacterRepositry(this.characterWebService);
  Future<List<Character>> getAllCharacter() async {
    try {
      final characters = await characterWebService.getAllCharacters();
      return characters.map((e) => Character.fromJson(e)).toList();
    } catch (error) {
      //print(error.toString());
      return [];
    }
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    try {
      final quotes = await characterWebService.gatCharacterQuotes(charName);
      return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
    } catch (error) {
      //print(error.toString());
      return [];
    }
  }
}
