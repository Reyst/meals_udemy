import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      TabDeclaration(
        tab: Tab(
          icon: Icon(Icons.category),
          text: "Categories",
        ),
        screen: CategoryScreen(),
      ),
      TabDeclaration(
        tab: Tab(
          icon: Icon(Icons.star),
          text: "Favorites",
        ),
        screen: Center(
          child: Text("Favorites"),
        ),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals"),
          bottom: TabBar(tabs: tabs.map((item) => item.tab).toList()),
        ),
        body: TabBarView(
          children: tabs.map((item) => item.screen).toList(),
        ),
      ),
    );
  }
}

class TabDeclaration {
  final Tab tab;
  final Widget screen;

  TabDeclaration({@required this.tab, @required this.screen});
}
