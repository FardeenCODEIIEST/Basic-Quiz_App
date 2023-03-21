import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; // The data whilst the object is live cannot change

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        //child is core of container
        width: double.infinity, // infinity is full width of the device
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign:
              TextAlign.center, // center is enum sort of pre-defined values
        ));
  }
}
