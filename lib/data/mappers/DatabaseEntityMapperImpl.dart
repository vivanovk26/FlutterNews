import 'package:news_app/data/mappers/DatabaseEntityMapper.dart';
import 'package:news_app/domain/dto/Article.dart';

class DatabaseEntityMapperImpl extends DatabaseEntityMapper {
  // Article
  static const String _ARTICLE_ID = "id";
  static const String _ARTICLE_DESCRIPTION = "description";
  static const String _ARTICLE_TITLE = "title";
  static const String _ARTICLE_URL_TO_IMAGE = "urlToImage";

  @override
  Map<String, dynamic> mapArticleToEntity(Article article) {
    return {
      _ARTICLE_ID: article.id,
      _ARTICLE_TITLE: article.title,
      _ARTICLE_DESCRIPTION: article.description,
      _ARTICLE_URL_TO_IMAGE: article.urlToImage,
    };
  }

  @override
  Article mapEntityToArticle(Map<String, dynamic> map) {
    return Article(
      map[_ARTICLE_ID],
      map[_ARTICLE_TITLE],
      map[_ARTICLE_DESCRIPTION],
      map[_ARTICLE_URL_TO_IMAGE],
      true,
    );
  }
}
