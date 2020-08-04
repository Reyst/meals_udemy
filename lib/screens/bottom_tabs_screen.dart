import 'package:flutter/material.dart';

import '../widgets/main_app_bar.dart';
import '../widgets/main_drawer.dart';
import 'category_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int _currentIndex = 0;

  final pages = const [
    Page(
      title: 'Categories',
      screen: CategoryScreen(),
      tab: BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('Categories'),
      ),
    ),
    Page(
      title: 'Your favorite meals',
      screen: const Center(child: const Text("Favorites")),
      tab: BottomNavigationBarItem(
        icon: Icon(Icons.star),
        title: Text('Favorites'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: obtainMainAppBar(title: pages[_currentIndex].title, icon: Icons.restaurant_outlined),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: pages.map((item) => item.tab).toList(),
        onTap: _switchTo,
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white38,
        selectedItemColor: Theme.of(context).accentColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        elevation: 4,
      ),
      body: pages[_currentIndex].screen,
    );
  }

  void _switchTo(int value) {
    if (value != _currentIndex) setState(() => _currentIndex = value);
  }
}

class Page {
  final String title;
  final BottomNavigationBarItem tab;
  final Widget screen;

  const Page({
    @required this.title,
    @required this.tab,
    @required this.screen,
  });
}
