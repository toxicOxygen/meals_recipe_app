import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filter_screen";
  
  final Map<String,bool> filters;
  final Function onFiltersSet;

  FiltersScreen(this.filters,this.onFiltersSet);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _isGlutenFree ;
  bool _isLactoseFree;
  bool _isVegan ;
  bool _isVegetarian ;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.filters["isGlutenFree"];
    _isLactoseFree = widget.filters["isLactoseFree"];
    _isVegan = widget.filters["isVegan"];
    _isVegetarian = widget.filters["isVegetarian"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _changeFilter,
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text("Gluten-Free"),
                  value: _isGlutenFree,
                  onChanged: (val)=> setState((){ _isGlutenFree = val; }),
                ),
                SwitchListTile(
                  title: Text("Lactose-Free"),
                  value: _isLactoseFree,
                  onChanged: (val)=> setState((){ _isLactoseFree = val; }),
                ),
                SwitchListTile(
                  title: Text("Vegan"),
                  value: _isVegan,
                  onChanged: (val)=> setState((){ _isVegan = val; }),
                ),
                SwitchListTile(
                  title: Text("Vegetarian"),
                  value: _isVegetarian,
                  onChanged: (val)=> setState((){ _isVegetarian = val; }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _changeFilter(){
    Map<String,bool> filters = {
      "isGlutenFree":_isGlutenFree,
      "isLactoseFree":_isLactoseFree,
      "isVegan":_isVegan,
      "isVegetarian":_isVegetarian
    };
    widget.onFiltersSet(filters);
    _showConfirmationToast();
  }

  void _showConfirmationToast(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Filters saved"),
        duration: Duration(seconds: 1),
        action: SnackBarAction(
          label: 'OK',
          onPressed: (){},
        ),
      )
    );
  }
}