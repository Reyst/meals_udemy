import 'package:flutter/foundation.dart';

import 'affordability.dart';
import 'complexity.dart';

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    this.isGlutenFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
    this.isLactoseFree = false,
  });
}
