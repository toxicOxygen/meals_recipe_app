import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorites;

  TabsScreen(this.favorites);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String,Object>> _pages;

  int _currentScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      { "page": CategoriesScreen(),"title": "Categories" },
      { "page": FavoritesScreen(widget.favorites),"title": "Favorites" }
    ];
  }

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