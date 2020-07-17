import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgColor;

  const CategoryItem({
    Key key,
    this.title,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = const Radius.circular(12);
    const borderRadius = const BorderRadius.all(radius);

    return Card(
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
    );
  }
}
