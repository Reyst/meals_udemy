import 'package:flutter/material.dart';

class CategoryRecipesScreen extends StatelessWidget {
/*
  final String categoryTitle;
  final String categoryId;

  const CategoryRecipesScreen({
    Key key,
    @required this.categoryId,
    @required this.categoryTitle,
  }) : super(key: key);
*/

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = args["title"] ?? "Unknown category";

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("Recipes from the $categoryTitle!"),
      ),
    );
  }
}
