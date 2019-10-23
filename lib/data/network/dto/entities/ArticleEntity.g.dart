// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleEntity _$ArticleEntityFromJson(Map<String, dynamic> json) {
  return ArticleEntity(json['title'] as String ?? '', json['description'] as String ?? '',
      json['urlToImage'] as String ?? '', json['publishedAt'] as String ?? '');
}

Map<String, dynamic> _$ArticleEntityToJson(ArticleEntity instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt
    };
