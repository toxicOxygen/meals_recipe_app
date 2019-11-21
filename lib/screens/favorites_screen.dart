import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty ? Container(
      child: Center(
        child: Text(
          "Youd don't have any favorites yet",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    ):ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (ctx,index){
        return MealItem(meal: favorites[index],);
      },
    );
  }
}