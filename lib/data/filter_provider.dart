
import '../models/meal_filter.dart';

class FilterProvider {

  MealFilter _mealFilter = MealFilter();

  MealFilter get mealFilter => _mealFilter;

//  void updateMealFilter(MealFilter mealFilter) => this._mealFilter = mealFilter;
  void updateFilter(Map<String, bool> filter) => this._mealFilter = MealFilter(filter: filter);
}