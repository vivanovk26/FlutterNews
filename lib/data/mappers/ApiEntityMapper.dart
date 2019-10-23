import 'package:news_app/data/error/ParseException.dart';
import 'package:news_app/data/network/dto/entities/ArticleEntity.dart';
import 'package:news_app/data/network/dto/responses/ArticlesResponse.dart';
import 'package:news_app/domain/dto/Article.dart';

class ApiEntityMapper {
  List<Article> mapArticles(ArticlesResponse articlesResponse) {
    // Nullability check in ArticleResponseEntity.
    return articlesResponse.articles
        .where((articleEntity) => _validArticle(articleEntity))
        .map((articleEntity) => mapArticle(articleEntity))
        .toList();
  }

  // Valid article has title or description and image to load.
  bool _validArticle(ArticleEntity articleEntity) {
    return ((articleEntity.title != null && articleEntity.title.isNotEmpty) ||
            (articleEntity.description != null && articleEntity.description.isNotEmpty)) &&
        (articleEntity.urlToImage != null && articleEntity.urlToImage.isNotEmpty);
  }

  Article mapArticle(ArticleEntity articleEntity) {
    if (_validArticle(articleEntity)) {
      return Article(parseOptionalString(articleEntity.title), parseOptionalString(articleEntity.description),
          parseRequiredString(articleEntity.urlToImage), 0);
      // parseOptionalDynamic(articleEntity.publishedAt, articleEntity.publishedAt != null, 0));
    } else {
      throw ParseException("Error while parsing $articleEntity");
    }
  }

  String parseOptionalString(String value, {String defaultValue = ""}) {
    return (value != null && value.isNotEmpty) ? value : defaultValue;
  }

  String parseRequiredString(String value) {
    return (value != null && value.isNotEmpty) ? value : throw ParseException("Error while parsing $value");
  }

  dynamic parseOptionalDynamic(dynamic value, bool valid, dynamic defaultValue) {
    return valid ? value : defaultValue;
  }
}
