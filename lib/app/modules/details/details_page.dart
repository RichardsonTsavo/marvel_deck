import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_deck/app/modules/details/details_store.dart';
import 'package:flutter/material.dart';
import 'package:marvel_deck/app/shared/models/character_model.dart';
import 'package:marvel_deck/app/shared/utils/style/style.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final CharacterModel character;
  const DetailsPage(
      {Key? key, this.title = 'DetailsPage', required this.character})
      : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  final DetailsStore store = Modular.get();
  PageController pageController = PageController();
  ConstStyle constStyle = ConstStyle();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: SizedBox(
                      height: constraints.maxHeight * 0.6,
                      width: constraints.maxWidth,
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/logo.jpg",
                          image: widget.character.thumbnail!,
                          fit: BoxFit.cover))),
              Container(
                  margin: EdgeInsets.only(top: constraints.maxHeight * 0.5),
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      color: constStyle.tertiaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Nome: ${widget.character.name!}",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.065),
                          ),
                        ),
                        Text(
                          "Descrição: ${widget.character.description!}",
                          style:
                              TextStyle(fontSize: constraints.maxWidth * 0.045),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("Quadrinhos",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.065)),
                        Text(
                            "Apareceu em ${widget.character.comics!.items!.length} quadrinhos até o momento",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.035)),
                        ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: constStyle.primaryColor,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: widget.character.comics!.items!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                  widget.character.comics!.items![index].name!),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Histórias",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.065)),
                        Text(
                            "Apareceu em ${widget.character.stories!.items!.length} histórias até o momento",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.035)),
                        ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: constStyle.primaryColor,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: widget.character.stories!.items!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(widget
                                  .character.stories!.items![index].name!),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Eventos",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.065)),
                        Text(
                            "Apareceu em ${widget.character.events!.items!.length} eventos até o momento",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.035)),
                        ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: constStyle.primaryColor,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: widget.character.events!.items!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                  widget.character.events!.items![index].name!),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text("Séries",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.065)),
                        Text(
                            "Apareceu em ${widget.character.series!.items!.length} séries até o momento",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.035)),
                        ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: constStyle.primaryColor,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: widget.character.series!.items!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                  widget.character.series!.items![index].name!),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
