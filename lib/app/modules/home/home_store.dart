import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:marvel_deck/app/shared/models/character_model.dart';
import 'package:marvel_deck/app/shared/server/server_repository.dart';
import 'package:marvel_deck/app/shared/server/server_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IServerRepositoryInterface _serverRepositoryInterface =
      ServerRepository();
  final PagingController<int, CharacterModel> pagingController =
      PagingController(firstPageKey: 0);

  int offset = -20;

  Future getCharacters() async {
    offset += 20;
    List<CharacterModel> data =
        await _serverRepositoryInterface.getCharacters(offset: offset);
    pagingController.appendPage(data, offset);
  }

  Future<List<CharacterModel>> searchCharacters(String characterName) async {
    List<CharacterModel> data = await _serverRepositoryInterface
        .searchCharacters(character: characterName);
    return data;
  }
}
