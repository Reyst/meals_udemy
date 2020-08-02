import 'package:flutter/material.dart';

import 'screens/meal_detail_screen.dart';
import 'screens/category_screen.dart';
import 'screens/category_recipes_screen.dart';

class RouteProvider {

  static Map<String, WidgetBuilder> routes = {
    "/": (ctx) => CategoryScreen(),
    CategoryRecipesScreen.ROUTE_NAME: (ctx) => CategoryRecipesScreen.forNavigation(ctx),
    MealDetailScreen.ROUTE_NAME: (ctx) => MealDetailScreen.forNavigation(ctx)
  };

}