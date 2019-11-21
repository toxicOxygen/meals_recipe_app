import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main(){
  runApp(App());
}


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  Map<String,bool> _filters = {
    "isGlutenFree":false,
    "isLactoseFree":false,
    "isVegan":false,
    "isVegetarian":false
  };

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favorites = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      routes: {
        "/": (ctx)=> TabsScreen(_favorites) ,
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(_meals),
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(_favorites,_toggleFavorites),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(_filters,_changeFilters)
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen()
        );
      },
    );
  }

  _changeFilters(Map<String,bool> newFilter){
    setState(() {
      _filters = newFilter;

      _meals = DUMMY_MEALS.where((meal){
        if(_filters['isGlutenFree'] && !meal.isGlutenFree)
          return false;
        if(_filters['isLactoseFree'] && !meal.isLactoseFree)
          return false;
        if(_filters['isVegan'] && !meal.isVegan)
          return false;
        if(_filters['isVegetarian'] && !meal.isVegetarian)
          return false;
        return true;
      }).toList();

    });
  }

  _toggleFavorites(Meal meal){
    if(_favorites.contains(meal)){
      setState(() {
        _favorites.removeWhere((item)=> item.id == meal.id);
      });
    }else{
      setState(() {
        _favorites.add(meal);
      });
    }
  }

}
