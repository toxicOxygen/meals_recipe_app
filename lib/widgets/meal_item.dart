import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {

  final Meal meal;

  MealItem({@required this.meal});

  String get complexityText{
    switch(meal.complexity){
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Simple:
        return "Simple";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText{
    switch(meal.affordability){
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: ()=> _onMealSelected(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0)
                      )
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26,color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _rowDisplay("${meal.duration} min", Icons.schedule),
                  _rowDisplay(complexityText, Icons.work),
                  _rowDisplay(affordabilityText, Icons.attach_money)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowDisplay(String txt,IconData icon){
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 6,),
        Text(txt)
      ],
    );
  }

  _onMealSelected(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments: meal);
  }
}