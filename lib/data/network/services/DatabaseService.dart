import 'package:news_app/domain/dto/Article.dart';

abstract class DatabaseService {
  Future<void> insertArticle(Article article);

  Future<List<Article>> getArticles();

  Future<void> deleteArticle(String articleId);
}
