import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/category.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const String routeName = "/category_meals";

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal)=>meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.title}"),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx,index){
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}