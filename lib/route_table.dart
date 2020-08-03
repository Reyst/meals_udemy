import 'package:flutter/material.dart';

import 'screens/bottom_tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
//import 'screens/category_screen.dart';
import 'screens/category_recipes_screen.dart';

abstract class RouteProvider {
  static Map<String, WidgetBuilder> routes = {
    "/": (ctx) => BottomTabsScreen(), //CategoryScreen(),
    CategoryRecipesScreen.ROUTE_NAME: (ctx) => CategoryRecipesScreen.forNavigation(ctx),
    MealDetailScreen.ROUTE_NAME: (ctx) => MealDetailScreen.forNavigation(ctx)
  };
}