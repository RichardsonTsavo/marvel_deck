import 'dart:convert';

import 'package:marvel_deck/app/shared/models/comics_model.dart';
import 'package:marvel_deck/app/shared/models/events_model.dart';
import 'package:marvel_deck/app/shared/models/series_model.dart';
import 'package:marvel_deck/app/shared/models/stories_model.dart';
import 'package:marvel_deck/app/shared/models/urls_model.dart';

class CharacterModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  String? resourceURI;
  String? thumbnail;
  List<UrlsModel>? urls;
  ComicsModel? comics;
  StoriesModel? stories;
  EventsModel? events;
  SeriesModel? series;

  CharacterModel(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.resourceURI,
      this.thumbnail,
      this.urls,
      this.comics,
      this.stories,
      this.events,
      this.series});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) {
      map["id"] = id;
    }
    if (name != null) {
      map["name"] = name;
    }
    if (description != null) {
      map["description"] = description;
    }
    if (modified != null) {
      map["modified"] = modified;
    }
    if (resourceURI != null) {
      map["resourceURI"] = resourceURI;
    }
    if (thumbnail != null) {
      map["thumbnail"] = thumbnail;
    }
    if (urls != null) {
      map["urls"] = urls;
    }
    if (comics != null) {
      map["comics"] = comics!.toMap();
    }
    if (stories != null) {
      map["stories"] = stories;
    }
    if (events != null) {
      map["events"] = events;
    }
    if (series != null) {
      map["series"] = series;
    }
    return map;
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      modified: map['modified'],
      resourceURI: map['resourceURI'],
      thumbnail: map['thumbnail']["path"] +
          "/" +
          "portrait_uncanny." +
          map['thumbnail']["extension"],
      urls: List.generate(
          map['urls'].length, (index) => UrlsModel.fromMap(map['urls'][index])),
      comics: ComicsModel.fromMap(map['comics']),
      stories: StoriesModel.fromMap(map['stories']),
      events: EventsModel.fromMap(map['events']),
      series: SeriesModel.fromMap(map['series']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}
