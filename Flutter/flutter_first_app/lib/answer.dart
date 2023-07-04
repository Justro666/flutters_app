import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerHandeler;
  final String answers;

  Answer(this.answerHandeler, this.answers);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red),
              backgroundColor: MaterialStateProperty.all(Colors.yellow)),
          onPressed: answerHandeler,
          child: Text(answers)),
    );
  }
}
