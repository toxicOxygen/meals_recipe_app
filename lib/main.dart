import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';

void main(){
  runApp(App());
}


class App extends StatelessWidget {
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
        "/": (ctx)=> TabsScreen() ,
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen()
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen()
        );
      },
    );
  }
}