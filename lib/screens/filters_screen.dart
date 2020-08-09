import 'package:flutter/material.dart';

import '../widgets/main_app_bar.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String ROUTE = "/filters";

  const FiltersScreen({Key key}) : super(key: key);

  FiltersScreen.forNavigation(BuildContext ctx) : this();

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _filterMap = {
    "isGlutenFree": _FilterItemState(),
    "isVegan": _FilterItemState(),
    "isVegetarian": _FilterItemState(),
    "isLactoseFree": _FilterItemState(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: obtainMainAppBar(
          title: "Your Filters",
          icon: Icons.restaurant_outlined,
          actions: [IconButton(icon: Icon(Icons.save_rounded), onPressed: () {})]),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              "Adjust your preferences:",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._createFilterSwitch(
                    context: context,
                    filterKey: "isGlutenFree",
                    title: "Gluten-free",
                    description: "Meals which don't contain gluten or contain its minimal amount.",
                  ),
                  ..._createFilterSwitch(
                    context: context,
                    filterKey: "isLactoseFree",
                    title: "Lactose-free",
                    description: "Meals which don't contain lactose or contain its minimal amount.",
                  ),
                  ..._createFilterSwitch(
                    context: context,
                    filterKey: "isVegetarian",
                    title: "Vegetarian",
                    description: "Vegetarian meals",
                  ),
                  ..._createFilterSwitch(
                    context: context,
                    filterKey: "isVegan",
                    title: "Vegan",
                    description: "Vegan meals",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeSetting(String key, {bool value, bool isUsed}) {
    setState(() {
      _filterMap[key] = _FilterItemState(
        isUsed: isUsed ?? (_filterMap[key].isUsed ?? false),
        value: value ?? (_filterMap[key].value ?? false),
      );
    });
  }

  List<Widget> _createFilterSwitch({
    @required BuildContext context,
    @required String filterKey,
    @required String title,
    @required String description,
  }) {
    return [
      Row(
        children: [
          Checkbox(
              value: _filterMap[filterKey].isUsed ?? false,
              onChanged: (isChecked) => _changeSetting(filterKey, isUsed: isChecked)),
          Text(
            'Use "$title" filter',
            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16),
          ),
        ],
      ),
      SwitchListTile(
        value: _filterMap[filterKey].value,
        onChanged: _filterMap[filterKey].isUsed ? (isChecked) => _changeSetting(filterKey, value: isChecked) : null,
        title: Text(title),
        subtitle: Text(description),
      ),
      Divider()
    ];
  }
}

class _FilterItemState {
  final bool isUsed;
  final bool value;

  _FilterItemState({this.isUsed = false, this.value = false});
}
