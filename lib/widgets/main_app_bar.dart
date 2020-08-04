import 'package:flutter/material.dart';

AppBar obtainMainAppBar({Key key, IconData icon, String title}) {
  return AppBar(
    key: key,
    leading: (icon != null ? _buildLeading(icon) : null),
    title: Text(title),
  );
}

Builder _buildLeading(IconData icon) {
  return Builder(
    builder: (BuildContext context) => IconButton(
      icon: Icon(icon, size: 24),
      onPressed: () {
        var scaffoldState = Scaffold.of(context);
        if (scaffoldState.hasDrawer) scaffoldState.openDrawer();
      },
    ),
  );
}
