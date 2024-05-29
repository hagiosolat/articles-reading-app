import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/features/Presentation/mobile_views/tabs/all_article_tab.dart';
import 'package:trial_feature/features/Presentation/controller/articles_list_controller.dart';
import 'package:trial_feature/features/Presentation/mobile_views/tabs/favorite_article_tab.dart';
import 'package:trial_feature/features/Presentation/mobile_views/tabs/latest_article_tab.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Name of the App'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchField(
                  ref,
                ),
                const SizedBox(height: 20),
                const Text('Categories'),
                const TabBar(isScrollable: true, tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Priority'),
                  Tab(text: 'Latest'),
                ]),
                const Expanded(
                  child: TabBarView(children: [
                    AllArticleTab(),
                    FavoriteArticles(),
                    LatestArticles(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget searchField(
  WidgetRef ref,
) {
  return TextField(
      decoration: InputDecoration(
          filled: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(9))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
          prefixIcon: const Icon(Icons.search),
          fillColor: const Color(0XFFFAFAF9),
          hintText: 'Search for articles',
          suffixIcon: PopupMenuButton(
            icon: const Icon(Icons.filter_list_outlined),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: '1',
                child: Row(
                  children: [Text('Tag 1')],
                ),
              ),
              PopupMenuItem(
                value: '2',
                child: Row(
                  children: [Text('Tag 2')],
                ),
              ),
              PopupMenuItem(
                value: '3',
                child: Row(
                  children: [Text('Tag 3')],
                ),
              ),
              PopupMenuItem(
                value: '4',
                child: Row(
                  children: [Text('Tag 4')],
                ),
              ),
            ],
            onSelected: (value) {
              ref
                  .read(articlesScreenControllerProvider.notifier)
                  .getFilteredArticles(value);
            },
          )

          // Icon(Icons.filter_list_outlined)),
          ));
}
