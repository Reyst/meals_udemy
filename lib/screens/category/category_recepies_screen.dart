import 'package:flutter/material.dart';

import 'package:meals/data/data_provider.dart';
import 'meal_item.dart';


class CategoryRecipesScreen extends StatelessWidget {
  static const String ROUTE_NAME = "/category-recipes";

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
    final categoryId = args["id"] ?? "";

    final meals = DataProvider.DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
      ),
    );
  }
}
