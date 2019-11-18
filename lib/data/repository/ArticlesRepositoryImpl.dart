import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/data/network/services/DatabaseService.dart';
import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  // Just for clearer demonstration.
  static const int _REQUEST_DELAY = 1;

  final ApiService _apiService;
  final DatabaseService _databaseService;
  Set<String> _cachedBookmarksIds;

  ArticlesRepositoryImpl(this._apiService, this._databaseService);

  @override
  Future<List<Article>> getArticles() async {
    return _getBookmarkIds().then((bookmarkIds) {
      return _apiService.getArticles(bookmarkIds);
    });
  }

  Future<Set<String>> _getBookmarkIds() async {
    if (_cachedBookmarksIds == null) {
      _cachedBookmarksIds = (await _databaseService.getArticleIds()).toSet();
    }
    return _cachedBookmarksIds;
  }

  @override
  void updateBookmarkIdInCache(String bookmarkId) {
    if (_cachedBookmarksIds.contains(bookmarkId)) {
      _cachedBookmarksIds.remove(bookmarkId);
    } else {
      _cachedBookmarksIds.add(bookmarkId);
    }
  }

  @override
  Future<List<Article>> getBookmarks() {
    return _databaseService.getArticles();
  }

  @override
  Future<bool> changeItemBookmarkState(Article article) {
    bool inDatabase = _cachedBookmarksIds.contains(article.id);
    if (inDatabase) {
      _deleteBookmark(article.id);
    } else {
      _insertBookmark(article);
    }
    return Future.value(!inDatabase);
  }

  Future<int> _deleteBookmark(String articleId) {
    return _databaseService.deleteArticle(articleId);
  }

  Future<int> _insertBookmark(Article article) {
    return _databaseService.insertArticle(article);
  }
}
