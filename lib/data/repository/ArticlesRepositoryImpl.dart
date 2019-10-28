import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/data/repository/ArticlesRepository.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  // Just for clearer demonstration.
  static const int _REQUEST_DELAY = 3;
  ApiService _apiService;

  ArticlesRepositoryImpl(this._apiService);

  Future<List<Article>> getArticles() {
    return Future.delayed(Duration(seconds: _REQUEST_DELAY), () => _apiService.getArticles());
  }
}
