import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:line/models/shop.dart';

import 'api.dart';

class SocialShareProvider {
  static const String path = '/shops';
  final Api api;
  const SocialShareProvider(this.api);

  Future<List<Shop>> getManyFromKeyword(String search) async {
    try {
      Response response = await this.api.get(path, query: {"q": search});
      return _convertRawListToObject(response);
    } catch (e) {
      throw Exception("Erreur de chargement des shop");
    }
  }

  List<Shop> _convertRawListToObject(http.Response response) {
    return (json.decode(response.body) as List)
        .map((i) => Shop.fromJson(i))
        .toList();
  }
}
