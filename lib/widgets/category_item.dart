import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  CategoryItem({
    Key key,
    @required this.category,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    final title = category.title;
    final color = category.color;

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: ()=> _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
      ),
    );
  }

  _selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,arguments: category
    );
  }

}