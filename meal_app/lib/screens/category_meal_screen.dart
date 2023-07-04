import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  final List<Meal> filteredMeal;

  CategoryMeal(this.filteredMeal);
  static const routeName = '/categories';

  @override
  State<CategoryMeal> createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  String catTitle;
  List<Meal> meal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final argus =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = argus['id'];
    catTitle = argus['title'];
    meal = widget.filteredMeal
        .where((element) => element.categories.contains(catId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      meal.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catTitle)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: meal[index].id,
            imgUrl: meal[index].imageUrl,
            title: meal[index].title,
            duration: meal[index].duration,
            affordability: meal[index].affordability,
            complexity: meal[index].complexity,

          );
        }),
        itemCount: meal.length,
      ),
    );
  }
}
