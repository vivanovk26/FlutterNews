import 'dart:collection';

import 'package:news_app/data/error/ParseException.dart';
import 'package:news_app/data/mappers/ApiEntityMapper.dart';
import 'package:news_app/data/network/dto/entities/ArticleEntity.dart';
import 'package:news_app/data/network/dto/responses/ArticlesResponse.dart';
import 'package:news_app/domain/dto/Article.dart';

class ApiEntityMapperImpl implements ApiEntityMapper {
  @override
  List<Article> mapEntitiesToArticles(ArticlesResponse articlesResponse) {
    // Nullability check in ArticleResponseEntity.
    List<Article> duplicates = articlesResponse.articles
        .where((articleEntity) => _validArticle(articleEntity))
        .map((articleEntity) => mapEntityToArticle(articleEntity))
        .toList();
    // Easiest way to remove duplicated articles.
    return LinkedHashSet.of(duplicates).toList();
  }

  // Valid article has title or description and image to load.
  bool _validArticle(ArticleEntity articleEntity) {
    return ((articleEntity.title != null && articleEntity.title.isNotEmpty) ||
            (articleEntity.description != null && articleEntity.description.isNotEmpty)) &&
        (articleEntity.urlToImage != null && articleEntity.urlToImage.isNotEmpty);
  }

  Article mapEntityToArticle(ArticleEntity articleEntity) {
    if (_validArticle(articleEntity)) {
      final String title = _parseOptionalString(articleEntity.title);
      final String description = _parseOptionalString(articleEntity.description);
      return Article(
          title + description, // News API doesn't provides ids.
          title,
          description,
          _parseRequiredString(
            articleEntity.urlToImage,
          ));
    } else {
      throw ParseException("Error while parsing $articleEntity");
    }
  }

  String _parseOptionalString(String value, {String defaultValue = ""}) {
    return (value != null && value.isNotEmpty) ? value : defaultValue;
  }

  String _parseRequiredString(String value) {
    return (value != null && value.isNotEmpty) ? value : throw ParseException("Error while parsing $value");
  }
}
