// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticlesResponseImpl _$$ArticlesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticlesResponseImpl(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticlesResponseImplToJson(
        _$ArticlesResponseImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
