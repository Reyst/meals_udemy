import 'package:flutter/material.dart';

import 'screens/filters_screen.dart';
import 'screens/bottom_tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
//import 'screens/category_screen.dart';
import 'screens/category_recipes_screen.dart';

abstract class RouteProvider {
  static Map<String, WidgetBuilder> routes = {
    "/": (ctx) => BottomTabsScreen(), //CategoryScreen(),
    CategoryRecipesScreen.ROUTE: (ctx) => CategoryRecipesScreen.forNavigation(ctx),
    MealDetailScreen.ROUTE: (ctx) => MealDetailScreen.forNavigation(ctx),
    FiltersScreen.ROUTE: (ctx) => FiltersScreen.forNavigation(ctx)
  };
}