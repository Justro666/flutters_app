import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;
  final _question = const [
    {
      'questionText': 'What is your fav color',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'yellow', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your fav pet',
      'answers': [
        {'text': 'dog', 'score': 5},
        {'text': 'cat', 'score': 10},
        {'text': 'rat', 'score': 1}
      ]
    },
    {
      'questionText': 'What is your fav name',
      'answers': [
        {'text': 'max', 'score': 10},
        {'text': 'jazz', 'score': 1},
        {'text': 'brack', 'score': 5}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      questionIndex++;
    });

    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: questionIndex < _question.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: questionIndex,
              questions: _question,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
