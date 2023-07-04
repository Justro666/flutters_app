import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../models/meal.dart';

import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'GlutenFree': false,
    'Vegan': false,
    'Vegetarian': false,
    'LactoseFree': true,
  };

  List<Meal> filteredMeal = DUMMY_MEALS;
  List<Meal> favMeal = [];

  void filtered(Map<String, bool> filteredData) {
    setState(() {
      filter = filteredData;

      filteredMeal = DUMMY_MEALS.where((element) {
        if (filter['GlutenFree'] && !element.isGlutenFree) {
          return false;
        }
        if (filter['Vegan'] && !element.isVegan) {
          return false;
        }

        if (filter['Vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (filter['LactoseFree'] && !element.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void filterFav(String id) {
    final favIndex = DUMMY_MEALS.indexWhere((element) => element.id == id);

    if (favIndex >= 0) {
      setState(() {
        favMeal.removeAt(favIndex);
      });
      print('1');
    } else {
      setState(() {
        favMeal.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
      print('2');
    }
  }

  bool isFavMeal(String id) {
    return favMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
                  titleTextStyle: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      routes: {
        '/': (context) => TabBarScreeen(favMeal),
        CategoryMeal.routeName: ((context) => CategoryMeal(filteredMeal)),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(isFavMeal, filterFav),
        FilterScreen.routeName: ((context) => FilterScreen(filter, filtered))
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DeliMeals'),
//       ),
//       body: const Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
