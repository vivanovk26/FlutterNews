import "package:json_annotation/json_annotation.dart";

part "ArticleEntity.g.dart";

/**
 * Used in list all bad articles will be filtered out.
 */
@JsonSerializable()
class ArticleEntity {
  @JsonKey(nullable: true, defaultValue: "")
  String title;
  @JsonKey(nullable: true, defaultValue: "")
  String description;
  @JsonKey(nullable: true, defaultValue: "")
  String urlToImage;
  @JsonKey(nullable: true, defaultValue: "")
  String publishedAt;

  ArticleEntity(this.title, this.description, this.urlToImage, this.publishedAt);

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => _$ArticleEntityFromJson(json);
}
