import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/features/Presentation/controller/articles_list_controller.dart';
import 'package:trial_feature/features/Presentation/web_views/widgets/article_details.dart';
import 'package:trial_feature/features/Presentation/web_views/widgets/web_article_tile.dart';

class TabletArticle extends ConsumerStatefulWidget {
  const TabletArticle({super.key});

  @override
  ConsumerState<TabletArticle> createState() => _TabletArticleState();
}

class _TabletArticleState extends ConsumerState<TabletArticle> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  List<String> tabName = ['articles', 'Priority', 'Folders'];

  @override
  void initState() {
    ref.read(articlesScreenControllerProvider.notifier).getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final state = ref.watch(articlesScreenControllerProvider);
    final article = ref.watch(oneArticleControllerProvider);
    final readProgress = ref.watch(readProgressControllerProvider).value;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: 60,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 1420),
            //width: width,
            height: MediaQuery.of(context).size.height / 1.13,
            child: Row(
              children: [
                // Center(
                //   child: Text(width.toString()),
                // ),
                Container(
                    width: 190,
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              _pageController.jumpToPage(index);
                            });
                          },
                          child: SizedBox(
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: (selectedIndex == index) ? 50 : 0,
                                  width: 5,
                                  color: Colors.blue,
                                ),
                                Expanded(
                                    child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  alignment: Alignment.center,
                                  height: 50,
                                  color: selectedIndex == index
                                      ? Colors.blueGrey.withOpacity(0.2)
                                      : Colors.transparent,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/olaty.png',
                                            width: 30,
                                            height: 30,
                                          ),
                                          Text(tabName[index])
                                        ],
                                      )),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                const SizedBox(width: 5),
                SizedBox(
                  height: height / 1.05,
                  width: width / 1.3,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: height / 1.05,
                            width: width / 2.50,
                            child: Column(
                              children: [
                                Text('Articles List',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontWeight: FontWeight.bold)),
                                 SizedBox(
                                  height: height/30,
                                ),
                                SizedBox(
                                    height: height / 1.29,
                                    width: width / 2.89,
                                    child: state.when(
                                        data: (articles) => ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: articles.length,
                                            itemBuilder: (context, index) {
                                              return WebArticleTile(
                                                title: articles[index].title,
                                                priority:
                                                    articles[index].priority,
                                                image: articles[index].image,
                                                date: articles[index].date,
                                                isStarred:
                                                    articles[index].starred,
                                                readProgress: readProgress![
                                                        articles[index].id] ??
                                                    0.0,
                                                ontap: () {
                                                  ref
                                                      .read(
                                                          oneArticleControllerProvider
                                                              .notifier)
                                                      .getOneArticle(
                                                          index: index);
                                                },
                                              );
                                            }),
                                        error: (e, _) => Text(e.toString()),
                                        loading: () => const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          article.when(
                              data: (article) {
                                return Expanded(
                                  child: ArticleDetails(
                                    title: article.title,
                                    priority: article.priority,
                                    date: article.priority,
                                    image: article.image,
                                    description: article.description,
                                    id: article.id,
                                  ),
                                );
                              },
                              error: (e, _) => Text(e.toString()),
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ))
                        ],
                      ),
                      Container(
                        child: const Center(child: Text('FOLDERS')),
                      ),
                      Container(
                        child: const Center(child: Text('PRIORITY VIEW')),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
