import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  void _switchScreen(BuildContext context, String path, {bool replace = false}) {
    var navigator = Navigator.of(context, rootNavigator: true);
    while (navigator.canPop()) navigator.pop();

    if (replace)
      navigator.pushReplacementNamed(path);
    else
      navigator.pushNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _buildDrawerHeader(context),
          SizedBox(height: 20),
          _buildDrawerOption(
            context,
            Icons.restaurant_menu,
            'Meals',
            () => _switchScreen(context, "/", replace: true),
          ),
          _buildDrawerOption(
            context,
            Icons.settings,
            'Filters',
            () => _switchScreen(context, FiltersScreen.ROUTE),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: Theme.of(context).accentColor,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        "Cook now!",
        style: TextStyle(
          fontSize: 26,
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  _buildDrawerOption(BuildContext context, IconData icon, String title, Function action) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(title, style: TextStyle(fontSize: 24)),
      onTap: action,
    );
  }
}
