import 'meal.dart';

class MealFilter {

  static const KEY_GLUTEN = "isGlutenFree";
  static const KEY_VEGAN = "isVegan";
  static const KEY_VEGETARIAN = "isVegetarian";
  static const KEY_LACTOSE = "isLactoseFree";

  static Map<String, bool Function(Meal)> _mealFields = {
    KEY_GLUTEN: (meal) => meal.isGlutenFree,
    KEY_VEGAN: (meal) => meal.isVegan,
    KEY_VEGETARIAN: (meal) => meal.isVegetarian,
    KEY_LACTOSE: (meal) => meal.isLactoseFree,
  };

  Map<String, bool> filter;

  MealFilter({this.filter = const {}});

  bool isMealMatch(Meal meal) => filter.entries.every((filterItem) {
    return _isConditionValid(filterItem, meal);
  });

  bool _isConditionValid(MapEntry<String, bool> filterItem, Meal meal) {
    return filterItem.value == _mealFields[filterItem.key](meal);
  }
}
