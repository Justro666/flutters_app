import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const MealItem({
    @required this.id,
    @required this.imgUrl,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  void mealDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  String get _complexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return 'Simple';
        break;
      case (Complexity.Hard):
        return 'Hard';
        break;
      case (Complexity.Challenging):
        return 'Challenging';
        break;
      default:
        return 'Unknown';
    }
  }

  String get _affordText {
    switch (affordability) {
      case (Affordability.Affordable):
        return 'Affordable';
        break;
      case (Affordability.Pricey):
        return 'Pricey';
        break;
      case (Affordability.Luxurious):
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => mealDetail(context)),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: 220,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 10),
                      Text('${duration}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 10),
                      Text(_complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 10),
                      Text(_affordText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
