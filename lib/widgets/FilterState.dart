import 'package:flutter/material.dart';
import 'package:meals/models/MealFilter.dart';

class FilterState extends InheritedWidget {

  final Widget child;
  final MealFilter mealFilter;

  FilterState({@required this.child, @required this.mealFilter}) : super(child: child);

  static MealFilter of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FilterState>()
        ?.mealFilter;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}
