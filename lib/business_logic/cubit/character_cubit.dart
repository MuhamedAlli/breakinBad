import 'package:bloc/bloc.dart';
import 'package:braeking_bad/data/models/character_model.dart';
import 'package:braeking_bad/data/repositry/character_repositery.dart';
import 'package:meta/meta.dart';

import '../../data/models/char_qoutes.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepositry characterRepositry;
  List<Character> characters = [];
  CharacterCubit(this.characterRepositry) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    characterRepositry.getAllCharacter().then((value) {
      //print(value[0].nickname);
      emit(CharatersLaoded(value));
      characters = value;
    });
    return characters;
  }

  void getQuotes(String charName) {
    characterRepositry.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLaoded(quotes));
    });
  }
}
