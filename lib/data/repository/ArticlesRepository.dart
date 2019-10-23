import 'package:news_app/data/network/services/ApiService.dart';
import 'package:news_app/domain/dto/Article.dart';

class ArticlesRepository {
  ApiService _apiService;

  ArticlesRepository(this._apiService);

  Future<List<Article>> getArticles() {
    return Future.delayed(Duration(seconds: 1), () => _apiService.getArticles());
    //return _apiService.getArticles();
  }
}
