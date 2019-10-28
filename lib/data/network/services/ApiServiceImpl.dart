import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/mappers/ApiEntityMapper.dart';
import 'package:news_app/data/network/dto/responses/ArticlesResponse.dart';
import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/domain/dto/Article.dart';

class ApiServiceImpl implements ApiService {
  static const String API_KEY = "2d08907d2bc449c48c12eb4efd5f178b";
  static const String LANGUAGE = "en";
  static const int OK_CODE = 200;

  final ApiEntityMapper _apiEntityMapper;

  ApiServiceImpl(this._apiEntityMapper);

  Future<List<Article>> getArticles() async {
    final response = await http.get("https://newsapi.org/v2/top-headlines?language=$LANGUAGE&apiKey=$API_KEY");
    if (response.statusCode == OK_CODE) {
      final articlesResponse = ArticlesResponse.fromJson(json.decode(response.body));
      return _apiEntityMapper.mapArticles(articlesResponse);
    } else {
      throw Exception("Error while loading articles");
    }
  }
}
