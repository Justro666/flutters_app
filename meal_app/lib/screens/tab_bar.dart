import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/drawer_item.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabBarScreeen extends StatefulWidget {
  final List<Meal> favMeal;

  TabBarScreeen(this.favMeal);
  @override
  State<TabBarScreeen> createState() => _TabBarScreeen();
}

class _TabBarScreeen extends State<TabBarScreeen> {
  List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favMeal), 'title': 'Your Favorite'},
      {'page': FavoriteScreen(widget.favMeal), 'title': 'Your Favorite'},
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: DrawerItem(),
      body: _pages[_selectedIndex]['page'],
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _selectPage,
      //   selectedItemColor: Theme.of(context).accentColor,
      //   unselectedItemColor: Colors.white,
      //   // type: BottomNavigationBarType.shifting,
      //   currentIndex: _selectedIndex,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: Theme.of(context).primaryColor,
      //       icon: Icon(Icons.category),
      //       label: 'Cateegory',
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Theme.of(context).primaryColor,
      //       icon: Icon(Icons.star),
      //       label: 'Favorite',
      //     ),
      //   ],
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(255, 254, 229, 1),
        animationDuration: Duration(milliseconds: 300),
        index: _selectedIndex,
        color: Theme.of(context).primaryColor,
        onTap: _selectPage,
        items: [
          Icon(
            Icons.restaurant,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
