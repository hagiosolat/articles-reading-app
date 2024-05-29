import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_feature/constant/colors.dart';
import 'package:trial_feature/features/Presentation/controller/articles_list_controller.dart';

class ArticleDetails extends ConsumerStatefulWidget {
  const ArticleDetails({
    Key? key,
    this.title,
    this.description,
    this.tag,
    this.image,
    required this.priority,
    required this.id,
    required this.date,
  }) : super(key: key);
  final String? id;
  final String? title;
  final String? description;
  final String? tag;
  final String? image;
  final String priority;
  final String date;

  @override
  ConsumerState<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends ConsumerState<ArticleDetails> {
  ScrollController controller = ScrollController();

  double _progress = 0.0;

  @override
  void initState() {
    controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    setState(() {
      _progress = controller.offset / controller.position.maxScrollExtent;
    });
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 390,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          border: Border(
              top: BorderSide(
            width: 3.0,
            color: widget.priority == 'high'
                ? highBoxColor
                : widget.priority == 'medium'
                    ? mediumBoxColor
                    : widget.priority == 'low'
                        ? lowBoxColor
                        : Colors.grey,
          ))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  iconSize: 15,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new)),
              const Text('5 mins read'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share))
            ],
          ),
          LinearProgressIndicator(
            minHeight: 2,
            value: _progress,
            backgroundColor: Colors.lightGreen,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              widget.title ?? '',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: widget.priority == 'high'
                                  ? highBoxColor.withOpacity(0.2)
                                  : widget.priority == 'medium'
                                      ? mediumBoxColor.withOpacity(0.2)
                                      : widget.priority == 'low'
                                          ? lowBoxColor.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.2)),
                          child: Text(
                            '${widget.priority} priority',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: widget.priority == 'high'
                                        ? highBoxColor
                                        : widget.priority == 'medium'
                                            ? mediumBoxColor
                                            : widget.priority == 'low'
                                                ? lowBoxColor
                                                : Colors.grey,
                                    fontSize: 10),
                          ),
                        ),
                        Text('Latest',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    )),
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
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Image.network(
                    height: 224,
                    fit: BoxFit.cover,
                    widget.image ?? '',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                          child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null));
                    },
                    errorBuilder: (context, exception, trace) {
                      return const SizedBox.shrink();
                    },
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
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(readProgressControllerProvider.notifier)
                            .updateReadingProgress(widget.id!, _progress);
                      },
                      child: const Text('Save Progress')),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: Text(
                        widget.description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
