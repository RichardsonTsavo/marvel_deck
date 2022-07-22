import 'package:marvel_deck/app/shared/models/character_model.dart';

abstract class IServerRepositoryInterface {
  Future<List<CharacterModel>> getCharacters({required int offset});
  Future<List<CharacterModel>> searchCharacters({required String character});
}
