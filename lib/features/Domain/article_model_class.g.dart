// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      image: json['image'] as String? ?? '',
      path: json['path'] as String,
      priority: json['priority'] as String,
      starred: json['starred'] as bool,
      date: json['date'] as String,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tag': instance.tag,
      'image': instance.image,
      'path': instance.path,
      'priority': instance.priority,
      'starred': instance.starred,
      'date': instance.date,
      'articles': instance.articles,
      'isExpanded': instance.isExpanded,
    };
