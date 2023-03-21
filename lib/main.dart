//packages
import 'package:app01/result.dart';
import 'package:flutter/material.dart';

//Files
import './quiz.dart';
// This has many material themes and has base classes
// void main() {
//   runApp(MyApp()); //Accepts object of a class
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//EVERY WIDGET IS A CLASS!!!!
//Widget must 1.extend Stateless/ful widget and 2. have a build method
// We need to create a class to create a widget
// Class name follows pascal scale
// The connection is established between
// the main.dart and the flutter files
// using the pubspec.yaml file which
// stores the dependencies
// This state-class makes the state persistent even if the widget is re-build
class _MyAppState extends State<MyApp> {
  // Leading '_' makes the class a private class
  //Pointer connection
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Fardeen', 'score': 1},
        {'text': 'Tyrone', 'score': 5},
        {'text': 'Fred', 'score': 10},
      ],
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
    //var aBool=true;
    _totalScore += score;
    setState(() {
      // Updates the widget when the class property changes
      _questionIndex = _questionIndex + 1;
    }); //function takes function as argument
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more Questions');
    } else {
      print('No more questions');
    }
  }

  //build method is missing so add it
  @override
  //override makes the code cleaner and clearer
  //It tells us that is my build method overrides stateless widgets build method
  Widget build(BuildContext context) {
    //Flutter always calls the build method when it rebuilds or executes the build
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen.
    //build method returns the widget which I built
    // build method accepts context object: carries the metadata
    // metadata can be like position in the widget tree; widget size
    // MaterialApp is a class which has a constructor implemented below takes named arguments only
    // variable stores the address of the object
    // final will change during re-rendering
    //const will always be constant
    // we can have var questions=const [...]
    // and after that if we write questions=[]
    //no error is thrown as the previous data will be over-written
    //though modifying the questions list will throw an error
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz), //body
      ),
    ); // takes named arguments no ordering
  }
}

/** Convention is One widget per file */
/** Null safety is enabled due to higher versions of flutter 
 * Dart internally checks for scenarios that lead to null value leaading 
 * to problems during the run-time.
 * To deal with some errors in null safety try using 'as' keyword
*/