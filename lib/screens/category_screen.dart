import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';

import '../data/data_provider.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = get();

    return GridView(
        padding: const EdgeInsets.all(12),
        children: dataProvider.categories
            .map(
              (category) => CategoryItem(
                id: category.id,
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
//      ),
    );
  }

  const CategoryScreen();
}
