import 'package:flutter/material.dart';
import 'package:meals/data/data_provider.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String ROUTE = "/meal-details";

  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  MealDetailScreen.forNavigation(BuildContext context) : this(meal: ModalRoute.of(context).settings.arguments as Meal);

  @override
  Widget build(BuildContext context) {
    final List<String> categoryNames = DataProvider.DUMMY_CATEGORIES
        .where((category) => meal.categories.contains(category.id))
        .map((item) => item.title)
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            ..._mapStringsToText(context, meal.ingredients),
            _buildSectionTitle(context, 'Cooking'),
            ..._mapStringsToText(context, meal.steps),
            _buildSectionTitle(context, 'Categories'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _mapCategories(categoryNames),
              ),
            ),
            SizedBox(height: 20, width: double.infinity),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete, size: 32),
        elevation: 6,
        onPressed: () => Navigator.of(context).pop(meal.id),
      ),
    );
  }

  Container _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        "$title:",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  List<Widget> _mapStringsToText(BuildContext context, List<String> items) {
    return items
        .map((item) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Text(
                item,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ))
        .toList(growable: false);
  }

  List<Widget> _mapCategories(List<String> categoryNames) {
    return categoryNames
        .map(
          (categoryTitle) => Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
            child: Text(categoryTitle),
          ),
        )
        .toList();
  }
}
