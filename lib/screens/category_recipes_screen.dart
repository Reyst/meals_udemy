import 'package:flutter/material.dart';

import '../data/data_provider.dart';
import '../widgets/meal_item.dart';

class CategoryRecipesScreen extends StatelessWidget {
  static const String ROUTE = "/category-recipes";

  final String categoryTitle;
  final String categoryId;

  CategoryRecipesScreen({
    Key key,
    @required this.categoryId,
    @required this.categoryTitle,
  }) : super(key: key);

  static Map<String, String> _obtainArguments(BuildContext context) =>
      (ModalRoute.of(context).settings.arguments as Map<String, String>);

  CategoryRecipesScreen.forNavigation(BuildContext context)
      : this(categoryId: _obtainArguments(context)["id"], categoryTitle: _obtainArguments(context)["title"]);

  @override
  Widget build(BuildContext context) {
    final meals =
        DataProvider.DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList(growable: false);

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
