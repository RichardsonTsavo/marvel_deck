import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_deck/app/shared/models/character_model.dart';
import 'package:marvel_deck/app/shared/server/server_repository_interface.dart';
import 'package:marvel_deck/app/shared/utils/snackbar/global_snack_bar.dart';

class ServerRepository implements IServerRepositoryInterface {
  String publickey = "2736840328072ef99fddca9bc262c817";
  String timestamp = "";
  GlobalSnackBar snackBar = const GlobalSnackBar();
  Dio dio = Dio();

  String generateMd5() {
    timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return md5
        .convert(utf8.encode(
            "${timestamp}80011ae3f3c28d7f0a038f7fe341b7665257bc51$publickey"))
        .toString();
  }

  @override
  Future<List<CharacterModel>> getCharacters({required int offset}) async {
    String md5 = generateMd5();
    try {
      Response response = await dio.get(
          "https://gateway.marvel.com/v1/public/characters?limit=20&offset=$offset&ts=$timestamp&apikey=$publickey&hash=$md5");
      List<CharacterModel> characters = [];
      for (Map<String, dynamic> char in response.data["data"]["results"]) {
        characters.add(CharacterModel.fromMap(char));
      }
      return characters;
    } on DioError catch (onError) {
      snackBar.showErrorSnackbar(onError.response!.data["message"]);
      return [];
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacters(
      {required String character}) async {
    String md5 = generateMd5();
    try {
      Response response = await dio.get(
          "https://gateway.marvel.com/v1/public/characters?nameStartsWith=$character&ts=$timestamp&apikey=$publickey&hash=$md5");
      List<CharacterModel> characters = [];
      for (Map<String, dynamic> char in response.data["data"]["results"]) {
        characters.add(CharacterModel.fromMap(char));
      }
      return characters;
    } on DioError catch (onError) {
      snackBar.showErrorSnackbar(onError.response!.data["message"]);
      return [];
    }
  }
}
