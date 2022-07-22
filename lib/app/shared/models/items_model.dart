import 'dart:convert';

class ItemsModel {
  String? resourceURI;
  String? name;
  String? type;

  ItemsModel({
    this.resourceURI,
    this.name,
    this.type,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (resourceURI != null) {
      map["resourceURI"] = resourceURI;
    }
    if (name != null) {
      map["name"] = name;
    }
    if (type != null) {
      map["type"] = type;
    }
    return map;
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      resourceURI: map['resourceURI'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source));
}
