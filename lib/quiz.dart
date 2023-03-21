import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex}); // newer versions use just required;this tells compiler that variable has to be set
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(questions[questionIndex]['questionText']
            as String), // as String tells Flutter that the type inferred is not object but string
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']),
              answer['text']
                  as String); //()=>answerQuestion() this will be executed when onPressed is triggered not when the dart parses the code as that ()=> manages to gives the address of the function body it points to
        }).toList()
      ],
    ));
  }
}
