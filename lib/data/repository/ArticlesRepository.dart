import 'package:news_app/domain/dto/Article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getArticles();
}
