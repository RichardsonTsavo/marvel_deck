import 'dart:convert';

import 'package:marvel_deck/app/shared/models/items_model.dart';

class SeriesModel {
  int? available;
  String? collectionURI;
  List<ItemsModel>? items;

  SeriesModel({
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

  factory SeriesModel.fromMap(Map<String, dynamic> map) {
    return SeriesModel(
      available: map['available'],
      collectionURI: map['collectionURI'],
      items: List.generate(map['items'].length,
          (index) => ItemsModel.fromMap(map['items'][index])),
    );
  }

  String toJson() => json.encode(toMap());

  factory SeriesModel.fromJson(String source) =>
      SeriesModel.fromMap(json.decode(source));
}
