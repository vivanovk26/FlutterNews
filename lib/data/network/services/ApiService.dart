import 'package:news_app/domain/dto/Article.dart';

abstract class ApiService {
  Future<List<Article>> getArticles(Set<String> bookmarkIds);
}
