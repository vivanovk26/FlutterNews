import 'package:news_app/domain/dto/Article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getArticles();

  void updateBookmarkIdInCache(String bookmarkId);

  Future<List<Article>> getBookmarks();

  Future<bool> changeItemBookmarkState(Article article);
}
