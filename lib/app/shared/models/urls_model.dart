import 'dart:convert';

class UrlsModel {
  String? type;
  String? url;

  UrlsModel({
    this.type,
    this.url,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (type != null) {
      map["type"] = type;
    }
    if (url != null) {
      map["url"] = url;
    }
    return map;
  }

  factory UrlsModel.fromMap(Map<String, dynamic> map) {
    return UrlsModel(
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UrlsModel.fromJson(String source) =>
      UrlsModel.fromMap(json.decode(source));
}
