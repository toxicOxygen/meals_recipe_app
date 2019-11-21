import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail-screen";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title}",softWrap: true,overflow: TextOverflow.fade,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            _buildTitle(context, "Ingredients"),
            _buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx,index){
                  return Card(
                    color: Theme.of(ctx).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              )
            ),
            _buildTitle(context, "Steps"),
            _buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx,index)=>Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 20.0,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext ctx,String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "$title",
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child){
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey
        ),
        color: Colors.white,
      ),
      child: child,
    );
  }
}