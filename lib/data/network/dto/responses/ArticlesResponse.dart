import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/data/network/dto/entities/ArticleEntity.dart';

part "ArticlesResponse.g.dart";

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(required: true)
  List<ArticleEntity> articles;

  ArticlesResponse(this.articles);

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) => _$ArticlesResponseFromJson(json);
}
