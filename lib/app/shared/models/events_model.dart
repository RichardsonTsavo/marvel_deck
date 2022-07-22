import 'dart:convert';

import 'package:marvel_deck/app/shared/models/items_model.dart';

class EventsModel {
  int? available;
  String? collectionURI;
  List<ItemsModel>? items;

  EventsModel({
    this.available,
    this.collectionURI,
    this.items,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (available != null) {
      map["available"] = available;
    }
    if (collectionURI != null) {
      map["collectionURI"] = collectionURI;
    }
    if (items != null) {
      map["items"] = items;
    }
    return map;
  }

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      available: map['available'],
      collectionURI: map['collectionURI'],
      items: List.generate(map['items'].length,
          (index) => ItemsModel.fromMap(map['items'][index])),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventsModel.fromJson(String source) =>
      EventsModel.fromMap(json.decode(source));
}
