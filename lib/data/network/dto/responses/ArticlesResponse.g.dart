// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticlesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['articles']);
  return ArticlesResponse((json['articles'] as List)
      ?.map((e) => e == null ? null : ArticleEntity.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{'articles': instance.articles};
