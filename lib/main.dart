import 'package:flutter/material.dart';

import './question.dart';

void main() {
  runApp(F3app());
}
//void main() => runApp(F3app()); **shorthand**

// **add '_' in front of any identifier to turn it into provate entity** //

class F3app extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return F3appState();
  }
}

class F3appState extends State<F3app> {
  var quesIndex = 0;

  void ansQuestion() {
    setState(() {
      quesIndex += 1;
      if (quesIndex > 1) quesIndex = 0;
    });
    print(quesIndex);
  }

  @override //decorator to specify
  Widget build(BuildContext context) {
    var questions = ['What\'s your fav color?', 'What\'s your fav animal?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('F3App'),
        ),
        body: Column(
          children: [
            Question(questions[quesIndex]),
            ElevatedButton(
              child: Text('Ans 1'),
              onPressed: ansQuestion, //pointer to the function
            ),
            ElevatedButton(
              child: Text('Ans 2'),
              onPressed: () => print("Answer 2 chosen"), //anonymous function
            ),
            ElevatedButton(
              child: Text('Ans 3'),
              onPressed: () => print("Answer 3 chosen"),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {}
}
