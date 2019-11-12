import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/data/network/services/DatabaseService.dart';
import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  // Just for clearer demonstration.
  static const int _REQUEST_DELAY = 3;

  final ApiService _apiService;
  final DatabaseService _databaseService;

  ArticlesRepositoryImpl(this._apiService,
      this._databaseService,);

  Future<List<Article>> getArticles() {
    return Future.delayed(Duration(seconds: _REQUEST_DELAY), () => _apiService.getArticles());
  }

  @override
  Future<List<Article>> getBookmarks() {
    return _databaseService.getArticles();
  }

  @override
  Future<Function> insertBookmark(Article article) {
    return _databaseService.insertArticle(article);
  }

  @override
  Future<Function> deleteBookmark(String articleId) {
    return _databaseService.deleteArticle(articleId);
  }
}
