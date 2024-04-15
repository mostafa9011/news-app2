import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news/core/config/constants.dart';
import 'package:news/core/widget/custom_background_widget.dart';
import 'package:news/main.dart';
import 'package:news/pages/home/pages/category_view.dart';
import 'package:news/pages/home/widgets/custom_drawer.dart';
import 'package:news/pages/home/widgets/custom_item_widget.dart';
import '../../../models/category_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoryList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assets/images/sports.png",
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "general",
      title: "Politics",
      image: "assets/images/Politics.png",
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/images/health.png",
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business",
      title: "Business",
      image: "assets/images/bussines.png",
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "environment",
      title: "Environment",
      image: "assets/images/environment.png",
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/images/science.png",
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundwidget(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          title: Text(
            selectCategory == null ? "News App" : selectCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomDrawer(
          onCatrgoryDrawerTap: onDrawerCategoryClicked,
        ),
        body: selectCategory == null
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your Category \nof interset",
                      textAlign: TextAlign.start,
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF4F5A69),
                        height: 1.2,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 4 / 5,
                        ),
                        itemBuilder: (context, index) => CustomItemWidget(
                          index: index,
                          categoryModel: categoryList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(
                categoryModel: selectCategory!,
              ),
      ),
    );
  }

  CategoryModel? selectCategory;

  void onCategoryClicked(CategoryModel categoryModel) {
    selectCategory = categoryModel;
    log(categoryModel.id);
    setState(() {});
  }

  void onDrawerCategoryClicked() {
    setState(() {
      selectCategory = null;
    });
    navigatorKey.currentState!.pop();
  }
}
