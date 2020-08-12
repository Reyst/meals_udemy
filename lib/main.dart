import 'package:flutter/material.dart';

import 'models/MealFilter.dart';
import 'route_table.dart';
import 'widgets/FilterState.dart';

void main() {
  runApp(FilterState(child: MyApp(), mealFilter: MealFilter.empty(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto Condensed',
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            ),
//        bottomNavigationBarTheme: ThemeData.light().bottomNavigationBarTheme.copyWith(
//              elevation: 4,
//              backgroundColor: Theme.of(context).primaryColor,//Colors.blue,
//              unselectedItemColor: Colors.white38,
//              selectedItemColor: Theme.of(context).accentColor,
////              showUnselectedLabels: true,
//              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
////              selectedIconTheme: IconThemeData(color: Colors.white, opacity: 1, size: 24),
////              unselectedIconTheme: IconThemeData(color: Colors.black87, opacity: 1, size: 24),
//            ),
      ),
//      home: CategoryScreen(),
//      initialRoute: "/", // this parameter is used instead of 'home'
      routes: RouteProvider.routes,
    );
  }
}
