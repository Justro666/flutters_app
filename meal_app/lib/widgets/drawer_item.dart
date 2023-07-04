import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(
        String title, IconData icon, Function functionHandler) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: functionHandler,
      );
    }

    return Drawer(
      child: Column(children: [
        Container(
          height: 150,
          padding: EdgeInsets.all(20),
          width: double.infinity,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up !',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30),
          ),
          alignment: Alignment.center,
        ),
        SizedBox(height: 20),
        _buildListTile('Mealss', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        Divider(),
        _buildListTile('Filter', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
        }),
        Divider(),
      ]),
    );
  }
}
