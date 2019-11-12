import 'package:news_app/domain/dto/Article.dart';

abstract class DatabaseEntityMapper {
  Map<String, dynamic> mapArticleToEntity(Article article);

  Article mapEntityToArticle(Map<String, dynamic> map);
}
