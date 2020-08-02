import 'package:flutter/material.dart';

import 'route_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      ),
//      home: CategoryScreen(),
      initialRoute: "/", // this parameter is used instead of 'home'
      routes: RouteProvider.routes,
    );
  }
}
