import 'package:flutter/material.dart';
import 'package:meals/models/MealFilter.dart';

class FilterState extends StatefulWidget {
  final Widget child;
//  MealFilter filter;

  FilterState({
    @required this.child,
//    this.filter,
  });

  static FilterData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedFilterState>()?.state;
  }

  @override
  FilterData createState() => FilterData();
}

class FilterData extends State<FilterState> {
  MealFilter mealFilter = MealFilter();

//  FilterData() {
//    mealFilter = widget.filter ?? MealFilter();
//  }

  void updateFilter(MealFilter newFilter) => setState(() => mealFilter = newFilter);

  @override
  Widget build(BuildContext context) {
    return InheritedFilterState(
      key: widget.key,
      child: widget.child,
      state: this,
    );
  }
}

class InheritedFilterState extends InheritedWidget {
  final FilterData state;

  InheritedFilterState({
    Key key,
    @required this.state,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedFilterState old) => false;
}
