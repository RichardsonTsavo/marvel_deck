import 'dart:convert';

import 'package:marvel_deck/app/shared/models/items_model.dart';

class StoriesModel {
  int? available;
  String? collectionURI;
  List<ItemsModel>? items;

  StoriesModel({
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

  factory StoriesModel.fromMap(Map<String, dynamic> map) {
    return StoriesModel(
      available: map['available'],
      collectionURI: map['collectionURI'],
      items: List.generate(map['items'].length,
          (index) => ItemsModel.fromMap(map['items'][index])),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoriesModel.fromJson(String source) =>
      StoriesModel.fromMap(json.decode(source));
}
