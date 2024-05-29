import 'package:flutter/material.dart';
import 'package:trial_feature/constant/colors.dart';

// ignore: must_be_immutable
class WebArticleTile extends StatelessWidget {
  WebArticleTile(
      {super.key,
      this.image,
      this.priority,
      this.title,
      this.tag,
      this.isStarred = false,
      this.ontap,
      this.date,
      required this.readProgress});
  final String? image;
  final String? title;
  final String? priority;
  final String? tag;
  final double readProgress;
  bool isStarred;

  final String? date;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 9,
      width: width / 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border(
          left: BorderSide(
              color: priority == 'high'
                  ? highBoxColor
                  : priority == 'medium'
                      ? mediumBoxColor
                      : priority == 'low'
                          ? lowBoxColor
                          : Colors.grey,
              width: 3),
          right: BorderSide.none,
          top: BorderSide.none,
          bottom: BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          image == ''
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.only(right: 9.0),
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image ?? ''), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
          Expanded(
            child: GestureDetector(
              onTap: ontap,
              child: SizedBox(
                width: 200,
                //height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: priority == 'high'
                                  ? highBoxColor.withOpacity(0.2)
                                  : priority == 'medium'
                                      ? mediumBoxColor.withOpacity(0.2)
                                      : priority == 'low'
                                          ? lowBoxColor.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.2)),
                          child: Text(
                            '$priority Priority',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: priority == 'high'
                                        ? highBoxColor
                                        : priority == 'medium'
                                            ? mediumBoxColor
                                            : priority == 'low'
                                                ? lowBoxColor
                                                : Colors.grey,
                                    fontSize: 10),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: isStarred
                                ? const Icon(
                                    Icons.star_sharp,
                                    color: starredColor,
                                  )
                                : const Icon(
                                    Icons.star_border_outlined,
                                  ))
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      title ?? '',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      //overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined,
                                  size: 15.0,
                                  color: readProgress > 0.950
                                      ? Colors.green
                                      : readProgress > 0.000
                                          ? Colors.amberAccent
                                          : Colors.grey),
                              Text(readProgress > 0.950
                                  ? 'Completed'
                                  : readProgress > 0.000
                                      ? 'In Progress'
                                      : 'Not yet Started'),
                            ],
                          ),
                          const Text('12/12/24')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
