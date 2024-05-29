import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/features/Presentation/mobile_views/widgets/article_tile.dart';
import 'package:trial_feature/features/Presentation/controller/articles_list_controller.dart';
import 'package:trial_feature/features/Presentation/mobile_views/widgets/detail_widget.dart';

class LatestArticles extends ConsumerStatefulWidget {
  const LatestArticles({super.key});

  @override
  ConsumerState<LatestArticles> createState() => _LatestArticleState();
}

class _LatestArticleState extends ConsumerState<LatestArticles> {
  final DraggableScrollableController controller =
      DraggableScrollableController();
  @override
  void initState() {
    ref
        .read(articlesScreenControllerProvider.notifier)
        .getFilteredArticles('high');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(articlesScreenControllerProvider);
    final progress = ref.watch(readProgressControllerProvider).value;
    return state.when(
        data: (articles) => ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ArticleTile(
                title: articles[index].title,
                description: articles[index].description,
                priority: articles[index].priority,
                tag: articles[index].tag,
                image: articles[index].image,
                readProgress: progress![articles[index].id] ?? 0.0,
                ontap: () async {
                  if (mounted) {
                    final result = await showModalBottomSheet<double>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return ArticleReader(
                            article: articles[index],
                          );
                        });

                    if (result != null) {
                      ref
                          .read(readProgressControllerProvider.notifier)
                          .updateReadingProgress(articles[index].id, result);
                    }
                  }
                },
              );
            }),
        error: (e, _) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
