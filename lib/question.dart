import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionData; //add final for stateless widgets variables

  Question(this.questionData);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionData,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
