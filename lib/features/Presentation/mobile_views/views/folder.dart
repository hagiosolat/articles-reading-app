import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/features/Domain/article_model_class.dart';
import 'package:trial_feature/features/Presentation/controller/articles_list_controller.dart';

class FolderStructure extends ConsumerStatefulWidget {
  const FolderStructure({super.key});

  @override
  ConsumerState<FolderStructure> createState() => _FolderStructureState();
}

class _FolderStructureState extends ConsumerState<FolderStructure> {
  //final List<Article> _articles = _getArticles();
  bool testing = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(articlesScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Folder Structure'),
      ),
      body: SingleChildScrollView(
        child: state.when(
            data: (article) => _renderArticles(articles: article),
            error: (e, _) => Text(e.toString()),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }

  // Widget _renderArticles(List<Article> articles) {
  //   return ExpansionPanelList(
  //     expansionCallback: ((index, isExpanded) {
  //       setState(() {
  //         articles[index] = articles[index].copyWith(isExpanded: isExpanded);
  //       });
  //       print(articles[index].isExpanded);
  //     }),
  //     children: articles.map<ExpansionPanel>((article) {
  //       return ExpansionPanel(
  //         canTapOnHeader: true,
  //         headerBuilder: (context, isExpanded) {
  //           return Row(
  //             children: [
  //               isExpanded
  //                   ? const Icon(Icons.arrow_drop_down)
  //                   : const Icon(Icons.play_arrow),
  //               const Icon(Icons.folder_shared_rounded),
  //               Text(article.title)
  //             ],
  //           );
  //         },
  //         body: ListTile(
  //           title: Text(article.title),
  //           subtitle: _renderArticles(article.articles),
  //         ),
  //         isExpanded: article.isExpanded,
  //         // value: article.date
  //       );
  //     }).toList(),
  //   );
  // }
}

Widget _renderArticles({List<Article>? articles}) {
  return ExpansionPanelList.radio(
    children: articles!.map<ExpansionPanelRadio>((article) {
      return ExpansionPanelRadio(
        value: article.id,
        headerBuilder: (context, isExpanded) {
          return SizedBox(
            height: 75,
            child: Row(
              children: [
                isExpanded
                    ? const Icon(Icons.arrow_drop_down)
                    : const Icon(Icons.play_arrow),
                Image.asset('assets/folder_icon.png'),
                Text(article.title)
              ],
            ),
          );
        },
        body: ListTile(
          //title: Text(article.title),
          subtitle: _renderArticles(articles: article.articles),
        ),
      );
    }).toList(),
  );
}
