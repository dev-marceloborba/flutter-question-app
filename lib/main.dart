import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s you favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s you favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 4,
        },
        {
          'text': 'Snake',
          'score': 20,
        },
        {
          'text': 'Elephant',
          'score': 8,
        },
        {
          'text': 'Lion',
          'score': 2,
        }
      ]
    },
    {
      'questionText': 'Who\'s you favorite instructor?',
      'answers': [
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
