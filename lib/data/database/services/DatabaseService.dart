import 'package:news_app/domain/dto/Article.dart';

abstract class DatabaseService {
  Future<List<String>> getArticleIds();

  Future<List<Article>> getArticles();

  Future<int> insertArticle(Article article);

  Future<int> deleteArticle(String articleId);
}
