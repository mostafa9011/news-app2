import 'package:flutter/material.dart';
import 'package:news/network/api_manager.dart';

import 'article_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
  final String sourceId;

  const ArticlesListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiMAanager.fetchDataArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        var articlesList = snapshot.data ?? [];

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ArticleItemWidget(article: articlesList[index]),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }
}
