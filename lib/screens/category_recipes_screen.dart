import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../data/data_provider.dart';
import '../widgets/meal_item.dart';

class CategoryRecipesScreen extends StatefulWidget {
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
  _CategoryRecipesScreenState createState() => _CategoryRecipesScreenState();
}

class _CategoryRecipesScreenState extends State<CategoryRecipesScreen> {
  List<Meal> _meals;

  @override
  void initState() {
    _meals = DataProvider.DUMMY_MEALS.where((meal) => meal.categories.contains(widget.categoryId)).toList();
    super.initState();
  }

  void _removeItem(String itemId) {
    setState(() => _meals.removeWhere((item) => item.id == itemId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: _meals[index], onResultAction: _removeItem),
      ),
    );
  }
}
