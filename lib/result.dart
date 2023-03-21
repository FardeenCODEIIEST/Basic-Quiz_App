import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  //getter->property which is a mixture of property and method
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are the Top G';
    } else if (resultScore <= 12) {
      resultText = 'You are quite good';
    } else if (resultScore <= 16) {
      resultText = 'You are beta';
    } else {
      resultText = 'You are bad man';
    }
    return resultText;
  } // normal property whose value is calculated dynamically

  @override
  Widget build(BuildContext context) {
    return newMethod();
  }

  Center newMethod() {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz' + '❤️'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.yellowAccent),
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          )
        ],
      ),
    );
  }
}

// Note primary is not always the background color it is the thing that is primary to the given button context
