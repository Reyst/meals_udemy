import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = "/meal-details";

  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  MealDetailScreen.forNavigation(BuildContext context) : this(meal: ModalRoute.of(context).settings.arguments as Meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        child: Text(meal.toString()),
      ),
    );
  }
}
