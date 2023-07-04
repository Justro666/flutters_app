import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  final Function isFav;
  final Function filterFav;
  MealDetailScreen(this.isFav, this.filterFav);
  static const routeName = '/mealdetail';

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final argus = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == argus);

    Widget _buildHeader(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget _buildContainer(BuildContext context, Widget build) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: (media.size.height - media.padding.top) * 0.25,
        width: 300,
        child: build,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (media.size.height - media.padding.top) * 0.35,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildHeader(context, "Ingredient"),
            _buildContainer(
              context,
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildHeader(context, "Steps"),
            _buildContainer(
                context,
                ListView.builder(
                  itemBuilder: ((context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(),
                        ],
                      )),
                  itemCount: selectedMeal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          widget.filterFav(argus);
          print(argus);
        }),
        child: widget.isFav(argus) ? Icon(Icons.circle) : Icon(Icons.star),
      ),
    );
  }
}
