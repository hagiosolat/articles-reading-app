import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trial_feature/features/Domain/article_model_class.dart';

part 'articles_response.freezed.dart';
part 'articles_response.g.dart';

@freezed
class ArticlesResponse with _$ArticlesResponse {
  factory ArticlesResponse({
    required List<Article> articles,
  }) = _ArticlesResponse;

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
}
