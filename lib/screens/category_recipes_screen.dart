import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';

import '../data/filter_provider.dart';
import '../data/data_provider.dart';
import '../models/meal_filter.dart';
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
    final mealFilter = get<FilterProvider>()?.mealFilter ?? MealFilter();
    final DataProvider dataProvider = get();
    final meals = dataProvider.meals
        .where((meal) => meal.categories.contains(categoryId))
        .where((meal) => mealFilter.isMealMatch(meal))
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
