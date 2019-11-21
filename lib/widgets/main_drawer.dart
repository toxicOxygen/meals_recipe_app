import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking App!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30.0
              ),
            ),
          ),
          SizedBox(height: 20,),
          _buildTile('Meals', Icons.restaurant,'/',context),
          _buildTile('Filters', Icons.settings,FiltersScreen.routeName,context)
        ],
      ),
    );
  }

  Widget _buildTile(String txt,IconData icon, String routeName,BuildContext ctx){
    return ListTile(
      leading: Icon(icon),
      title: Text(txt),
      onTap: (){
        Navigator.of(ctx).pushReplacementNamed(routeName);
      },
    );
  }

}