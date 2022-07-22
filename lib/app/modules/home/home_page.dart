import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:marvel_deck/app/modules/home/home_store.dart';
import 'package:marvel_deck/app/shared/models/character_model.dart';
import 'package:marvel_deck/app/shared/utils/style/style.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = Modular.get();

  @override
  void initState() {
    store.pagingController.addPageRequestListener((pageKey) {
      store.getCharacters();
    });
    super.initState();
  }

  @override
  void dispose() {
    store.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: const Center(
              child: Text('Marvel Deck', textAlign: TextAlign.center)),
          title: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ConstStyle().tertiaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ConstStyle().tertiaryColor)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ConstStyle().tertiaryColor)),
                  hintText: " Procure pelo nome",
                  hintStyle: TextStyle(color: ConstStyle().tertiaryColor)),
              style: DefaultTextStyle.of(context).style.copyWith(
                  fontStyle: FontStyle.italic,
                  color: ConstStyle().tertiaryColor),
            ),
            keepSuggestionsOnSuggestionSelected: true,
            getImmediateSuggestions: false,
            noItemsFoundBuilder: (context) =>
                const Text(" Não foi possivel achar o personagem"),
            errorBuilder: (context, error) =>
                const Text(" Erro ao procurar personagem"),
            suggestionsCallback: (pattern) async {
              return await store.searchCharacters(pattern);
            },
            itemBuilder: (context, CharacterModel suggestion) {
              return SizedBox(
                  height: constraints.maxHeight / 5,
                  width: constraints.maxWidth,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.4,
                            child: FadeInImage.assetNetwork(
                                placeholder: "assets/logo.jpg",
                                image: suggestion.thumbnail!,
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nome: ${suggestion.name!}",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.035),
                                  ),
                                  Text(
                                    "Descrição: ${suggestion.description!}",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.035),
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            },
            onSuggestionSelected: (suggestion) {
              Modular.to.pushNamed("/details/", arguments: suggestion);
            },
          ),
          centerTitle: true,
        ),
        body: PagedListView<int, CharacterModel>(
          pagingController: store.pagingController,
          builderDelegate: PagedChildBuilderDelegate<CharacterModel>(
            animateTransitions: true,
            newPageErrorIndicatorBuilder: (context) =>
                const Text("Todos os persoangens foram adicionatos"),
            itemBuilder: (context, item, index) => GestureDetector(
              onTap: () {
                Modular.to.pushNamed("/details/", arguments: item);
              },
              child: SizedBox(
                  height: constraints.maxHeight / 5,
                  width: constraints.maxWidth,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.4,
                            child: FadeInImage.assetNetwork(
                                placeholder: "assets/logo.jpg",
                                image: item.thumbnail!,
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nome: ${item.name!}",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.035),
                                  ),
                                  Text(
                                    "Descrição: ${item.description!}",
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.035),
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ),
      );
    });
  }
}
