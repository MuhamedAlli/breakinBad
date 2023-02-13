part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharatersLaoded extends CharacterState {
  final List<Character> characters;
  CharatersLaoded(this.characters);
}

class QuotesLaoded extends CharacterState {
  final List<Quote> quotes;
  QuotesLaoded(this.quotes);
}
