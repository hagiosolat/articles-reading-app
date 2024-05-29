import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trial_feature/constant/colors.dart';
import 'package:trial_feature/features/Domain/article_model_class.dart';

class ArticleReader extends ConsumerStatefulWidget {
  const ArticleReader(
      { required this.article,      
      super.key});

  final Article article;

  @override
  ConsumerState<ArticleReader> createState() => _ArticleReaderState();
}

class _ArticleReaderState extends ConsumerState<ArticleReader> {
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.2,
        minChildSize: 0.1,
        maxChildSize: 0.9,
        builder: (context, controller) {
          controller.addListener(() {
            setState(() {
              if (controller.hasClients) {
                _progress =
                    controller.offset / controller.position.maxScrollExtent;
              }
            });
          });

          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: CustomScrollView(
              controller: controller,
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 4,
                      width: 40,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  title: const Center(child: Text('5 mins read')),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                  ],
                  primary: false,
                  pinned: true,
                  centerTitle: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: LinearProgressIndicator(
                      value: _progress,
                      backgroundColor: Colors.lightGreen,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        children: [
                          Text(
                            widget.article.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: widget.article.priority == 'high'
                                        ? highBoxColor.withOpacity(0.2)
                                        : widget.article.priority == 'medium'
                                            ? mediumBoxColor.withOpacity(0.2)
                                            : widget.article.priority == 'low'
                                                ? lowBoxColor.withOpacity(0.2)
                                                : Colors.grey.withOpacity(0.2)),
                                child: Text(
                                  '${widget.article.priority} priority',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: widget.article.priority == 'high'
                                              ? highBoxColor
                                              : widget.article.priority == 'medium'
                                                  ? mediumBoxColor
                                                  : widget.article.priority == 'low'
                                                      ? lowBoxColor
                                                      : Colors.grey,
                                          fontSize: 10),
                                ),
                              ),
                              const Text('Latest'),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_outlined,
                                    size: 15,
                                  ),
                                  Text(
                                    'In Progress',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Image.network(
                              widget.article.image,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                    child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null));
                              },
                              errorBuilder: (context, exception, trace) {
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Click here to site',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                                Text('Folder Path')
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                context.pop<double>(_progress);
                              },
                              child: Text('Save Progress',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.article.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            // ),
          );
        });
  }
}
