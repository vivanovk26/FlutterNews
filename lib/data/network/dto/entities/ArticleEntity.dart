import "package:json_annotation/json_annotation.dart";

part "ArticleEntity.g.dart";

/**
 * Used in list all bad articles will be filtered out.
 */
@JsonSerializable()
class ArticleEntity {
  @JsonKey(nullable: true, defaultValue: "")
  final String title;
  @JsonKey(nullable: true, defaultValue: "")
  final String description;
  @JsonKey(nullable: true, defaultValue: "")
  final String urlToImage;
  @JsonKey(nullable: true, defaultValue: "")
  final String publishedAt;

  ArticleEntity(this.title, this.description, this.urlToImage, this.publishedAt);

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => _$ArticleEntityFromJson(json);
}
