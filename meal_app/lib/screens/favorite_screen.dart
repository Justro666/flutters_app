import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeal;

  FavoriteScreen(this.favMeal);
  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return Center(
        child: Text('There is no Fav Meal Yet !'),
      );
    } else
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: favMeal[index].id,
            imgUrl: favMeal[index].imageUrl,
            title: favMeal[index].title,
            duration: favMeal[index].duration,
            affordability: favMeal[index].affordability,
            complexity: favMeal[index].complexity,
          );
        }),
        itemCount: favMeal.length,
      );
  }
}
