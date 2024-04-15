import 'package:flutter/material.dart';
import 'package:news/core/config/constants.dart';
import 'package:news/models/articles_data_model.dart';

class ArticleItemWidget extends StatefulWidget {
  final Articles article;

  const ArticleItemWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ArticleItemWidgetState createState() => _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  late String timeSincePublished;

  @override
  void initState() {
    super.initState();
    calculateTimeSincePublished();
  }

  void calculateTimeSincePublished() {
    final DateTime now = DateTime.now();
    final DateTime publishedAt = DateTime.parse(widget.article.publishedAt ?? now.toString());
    final Duration difference = now.difference(publishedAt);

    if (difference.inDays > 0) {
      timeSincePublished = '${difference.inDays} day(s) ago';
    } else if (difference.inHours > 0) {
      timeSincePublished = '${difference.inHours} hour(s) ago';
    } else if (difference.inMinutes > 0) {
      timeSincePublished = '${difference.inMinutes} minute(s) ago';
    } else {
      timeSincePublished = 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(widget.article.urlToImage ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.article.source?.name ?? "",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF79828B),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              widget.article.title ?? "",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                height: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              widget.article.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF79828B),
                height: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              timeSincePublished,
              textAlign: TextAlign.end,
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: Colors.black,
                height: 1.0,
                fontSize: 18  ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
