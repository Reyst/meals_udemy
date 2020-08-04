import 'package:flutter/material.dart';

import '../widgets/main_app_bar.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String ROUTE = "/filters";

  const FiltersScreen({Key key}) : super(key: key);

  FiltersScreen.forNavigation(BuildContext ctx) : this();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: obtainMainAppBar(title: "Your Filters", icon: Icons.restaurant_outlined),
      drawer: MainDrawer(),
      body: Center(child: Text("Filters")),
    );
  }
}
