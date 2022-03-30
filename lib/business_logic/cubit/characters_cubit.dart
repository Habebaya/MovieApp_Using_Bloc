import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:usingbloc/data/models/character.dart';
import 'package:usingbloc/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final CharacterRepo characterRepo;
  List<Character> characters =[] ;

  CharactersCubit(this.characterRepo) : super(CharactersInitial());


  List<Character> getAllCharacters(){
    characterRepo.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;

  }

}
