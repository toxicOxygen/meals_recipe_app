import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>> _pages = [
    { "page": CategoriesScreen(),"title": "Categories" },
    { "page": FavoritesScreen(),"title": "Favorites" }
  ];

  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentScreenIndex]["title"]),
      ),
      body: _pages[_currentScreenIndex]["page"],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite')
          ),
        ],
        onTap: (index)=> setState((){ _currentScreenIndex = index; }),
        currentIndex: _currentScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}