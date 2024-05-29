import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trial_feature/features/Data/article_repository.dart';
import 'package:trial_feature/features/Domain/article_model_class.dart';

part 'article_repository_provider.g.dart';

@riverpod
ArticleRepository articleRepository(ArticleRepositoryRef ref) =>
    const ArticleRepository();

@riverpod
Future<List<Article>> getArticles(GetArticlesRef ref) =>
    ref.watch(articleRepositoryProvider).getArticles();

@riverpod
Future<List<Article>> sortArticlesByPriority(SortArticlesByPriorityRef ref) =>
    ref.watch(articleRepositoryProvider).getSortedArticles();

@riverpod 
 Future<Article> getOneArticle(GetOneArticleRef ref,{required int index}) => 
      ref.watch(articleRepositoryProvider).getOneArticle(index);