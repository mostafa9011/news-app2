import 'package:flutter/material.dart';
import 'package:news/pages/home/widgets/tab_item_widget.dart';

import '../../../models/source_model.dart';
import 'articles_list_widget.dart';

class NewsLisyWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsLisyWidget({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsLisyWidget> createState() => _NewsLisyWidgetState();
}

class _NewsLisyWidgetState extends State<NewsLisyWidget> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourcesList.length,
          initialIndex: selectedindex,
          child: TabBar(
            onTap: (value) {
              selectedindex = value;
              setState(() {});
            },
            padding: const EdgeInsets.symmetric(vertical: 8),
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            indicator: const BoxDecoration(),
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sourcesList
                .map(
                  (e) => TabItemWidget(
                    sourceModel: e,
                    isSelected: selectedindex == widget.sourcesList.indexOf(e),
                  ),
                )
                .toList(),
          ),
        ),
        ArticlesListWidget(
          sourceId: widget.sourcesList[selectedindex].id,
        ),
      ],
    );
  }
}
