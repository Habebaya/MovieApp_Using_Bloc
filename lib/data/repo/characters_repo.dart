import 'package:usingbloc/data/models/character.dart';
import 'package:usingbloc/data/web_services/character_web_services.dart';

class CharacterRepo{
  final CharactersWebServices charactersWebServices;

  CharacterRepo(this.charactersWebServices);

  Future <List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();

  }


  }