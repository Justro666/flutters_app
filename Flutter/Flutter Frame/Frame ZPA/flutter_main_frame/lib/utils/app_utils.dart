import 'package:flutter/material.dart';

class AppUtils {
  static void showSnackBar(String str, BuildContext context,
      {color = Colors.blue}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(str),
      backgroundColor: color,
    ));
  }
}
