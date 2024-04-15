import 'package:flutter/material.dart';
import 'package:news/core/widget/custom_background_widget.dart';
import 'package:news/models/category_model.dart';
import 'package:news/network/api_manager.dart';
import 'package:news/pages/home/widgets/news_list_widget.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundwidget(
      child: FutureBuilder(
        future: ApiMAanager.fetchDataSources(widget.categoryModel.id),
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

          var sourcesList = snapshot.data ?? [];

          return NewsLisyWidget(sourcesList: sourcesList);
        },
      ),
    );
  }
}
