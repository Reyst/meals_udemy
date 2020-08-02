import 'package:flutter/material.dart';

import '../screens/category_recipes_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  const CategoryItem({
    Key key,
    this.id,
    this.title,
    this.bgColor,
  }) : super(key: key);

  void _openCategoryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryRecipesScreen.ROUTE_NAME,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const radius = const Radius.circular(12);
    const borderRadius = const BorderRadius.all(radius);

    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: borderRadius,
      onTap: () => _openCategoryScreen(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              colors: [bgColor.withOpacity(0.4), bgColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
