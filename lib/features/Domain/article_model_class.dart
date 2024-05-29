import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model_class.freezed.dart';
part 'article_model_class.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    required String id,
    required String title,
    required String description,
    required String tag,
    @Default('') String image,
  //  required DateTime readEstimationTime,
    required String path,
    required String priority,
    required bool starred,
    required String date,
    @Default([]) List<Article> articles,
    @Default(false) bool isExpanded,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
