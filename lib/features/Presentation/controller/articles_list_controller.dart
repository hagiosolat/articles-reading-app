import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial_feature/features/Data/providers/article_repository_provider.dart';
import 'package:trial_feature/features/Domain/article_model_class.dart';

part 'articles_list_controller.g.dart';

@riverpod
class ArticlesScreenController extends _$ArticlesScreenController {
  @override
  FutureOr<List<Article>> build() {
    return getArticles();
  }

  FutureOr<List<Article>> getArticles() async {
    final articlesService =
        await ref.read(articleRepositoryProvider).getArticles();

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => articlesService);
    return state.value!;
  }

  FutureOr<List<Article>> getFilteredArticles(String params) async {
    final articles = await ref.read(articleRepositoryProvider).getArticles();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async =>
        articles.where((article) => article.tag == params).toList());
    return state.value!;
  }

  FutureOr<List<Article>> sortPriorityarticles() async {
    final articles =
        await ref.read(articleRepositoryProvider).getSortedArticles();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => articles);
    return state.value!;
  }
}

@riverpod
class OneArticleController extends _$OneArticleController {
  @override
  FutureOr<Article> build() {
    return getOneArticle(index: 0);
  }

  FutureOr<Article> getOneArticle({required int index}) async {
    final article =
        await ref.read(articleRepositoryProvider).getOneArticle(index);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => article);
    return state.value!;
  }
}

@riverpod
class ReadProgressController extends _$ReadProgressController {
  @override
  FutureOr<Map<String, double>> build() {
    return _loadReadingProgress();
  }

  FutureOr<Map<String, double>> _loadReadingProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final progress = {
      for (var key in keys) key: prefs.getDouble(key) ?? 0.00000
    };
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => progress);
    print('shared preference values are $progress');
    return state.value!;
  }

  FutureOr<void> updateReadingProgress(
      String articleId, double progress) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(articleId, progress);
  }
}
