import 'package:flutter/material.dart';
import 'package:meal_app/widgets/drawer_item.dart';

class FilterScreen extends StatefulWidget {
  final Function filtered;
  final Map<String, bool> oldFilter;
  FilterScreen(this.oldFilter, this.filtered);

  static const routeName = '/filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.oldFilter['GlutenFree'];
    isVegan = widget.oldFilter['Vegan'];
    isVegetarian = widget.oldFilter['Vegetarian'];
    isLactoseFree = widget.oldFilter['LactoseFree'];
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String desc, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(desc),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> filtered = {
                  'GlutenFree': isGlutenFree,
                  'Vegan': isVegan,
                  'Vegetarian': isVegetarian,
                  'LactoseFree': isLactoseFree,
                };
                widget.filtered(filtered);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: DrawerItem(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Apply Your Filter',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchTile(
                'Glutine Free',
                'Witout Glutine',
                isGlutenFree,
                (value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                },
              ),
              _buildSwitchTile(
                'isVegan',
                'Vegens',
                isVegan,
                (value) {
                  setState(() {
                    isVegan = value;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegetarian',
                'Witout Glutine',
                isVegetarian,
                (value) {
                  setState(() {
                    isVegetarian = value;
                  });
                },
              ),
              _buildSwitchTile(
                'LactoseFree',
                'Witout Glutine',
                isLactoseFree,
                (value) {
                  setState(() {
                    isLactoseFree = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
