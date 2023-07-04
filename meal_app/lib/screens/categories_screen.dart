import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
// import 'dart:io';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  Widget _buildBody() {
    return GridView.builder(
        padding: const EdgeInsets.all(25),
        itemBuilder: (context, index) {
          return CategoryItem(
            DUMMY_CATEGORIES[index].id,
            DUMMY_CATEGORIES[index].title,
            DUMMY_CATEGORIES[index].color,
          );
        },
        itemCount: DUMMY_CATEGORIES.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ));
  }

  // Widget _buildAppBar() {
  //   return
  //       //  Platform.isIOS
  //       //     ? CupertinoNavigationBar(
  //       //         middle: Text('Meal App'),
  //       //       )
  //       //     :
  //       AppBar(title: const Text('Meal App'));
  // }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
