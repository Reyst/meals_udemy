import 'package:flutter/material.dart';

import '../../data/category_data_provider.dart';
import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(12),
        children: CategoryDataProvider.CATEGORIES
            .map(
              (category) => CategoryItem(
                title: category.title,
                bgColor: category.color,
              ),
            )
            .toList(growable: false),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
      ),
    );
  }
}
