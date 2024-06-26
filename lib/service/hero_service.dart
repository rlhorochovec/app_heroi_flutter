import 'dart:convert';
import 'package:app_heroi_flutter/model/hero_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "192.168.100.62:8080";

  static Future<dynamic> getHeroes() async {
    var url = Uri.http(baseUrl, '/api/heroes');
    var response = await http.get(url);
    final decodedResponse = utf8.decode(response.bodyBytes);

    var heroes = (json.decode(decodedResponse))
        .map((item) => HeroModel.fromJson(item))
        .toList();

    return heroes;
  }
}
