import 'meal.dart';

class MealFilter {
  static const KEY_GLUTEN = "isGlutenFree";
  static const KEY_VEGAN = "isVegan";
  static const KEY_VEGETARIAN = "isVegetarian";
  static const KEY_LACTOSE = "isLactoseFree";

  static const FILTER_KEYS = const [KEY_GLUTEN, KEY_VEGAN, KEY_VEGETARIAN, KEY_LACTOSE];

  static Map<String, bool Function(Meal)> _mealFields = {
    KEY_GLUTEN: (meal) => meal.isGlutenFree,
    KEY_VEGAN: (meal) => meal.isVegan,
    KEY_VEGETARIAN: (meal) => meal.isVegetarian,
    KEY_LACTOSE: (meal) => meal.isLactoseFree,
  };

  final Map<String, bool> _filter = <String, bool>{};

  MealFilter({Map<String, bool> filter}) {
    updateFilter(filter);
  }

  MealFilter.empty() : this();

  bool isMealMatch(Meal meal) => _filter.entries.every((filterItem) => _isConditionValid(filterItem, meal));

  bool _isConditionValid(MapEntry<String, bool> filterItem, Meal meal) {
    return filterItem.value == _mealFields[filterItem.key](meal);
  }

  void updateFilter(Map<String, bool> filter) {
    _filter.clear();
    var data = (filter ?? <String, bool>{});
    FILTER_KEYS.forEach((key) {
      var value = data[key];
      if (value != null) _filter[key] = value;
    });
  }

  bool operator [](String key) => _filter[key];
}
