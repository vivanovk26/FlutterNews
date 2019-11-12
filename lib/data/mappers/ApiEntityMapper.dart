import 'package:news_app/data/network/dto/entities/ArticleEntity.dart';
import 'package:news_app/data/network/dto/responses/ArticlesResponse.dart';
import 'package:news_app/domain/dto/Article.dart';

abstract class ApiEntityMapper {
  List<Article> mapEntitiesToArticles(ArticlesResponse articlesResponse);

  Article mapEntityToArticle(ArticleEntity articleEntity);
}
