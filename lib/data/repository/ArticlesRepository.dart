import 'package:news_app/domain/dto/Article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getArticles();

  Future<List<Article>> getBookmarks();

  Future<void> insertBookmark(Article article);

  Future<void> deleteBookmark(String articleId);
}
