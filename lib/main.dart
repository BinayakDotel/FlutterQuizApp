import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterncit/FetchData.dart';
import 'package:flutterncit/Answer.dart';
import './TextArea.dart';
import './InterfaceButton.dart';
import 'FetchData.dart';
import 'AddData.dart';
import 'Result.dart';
import 'Answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var index = 0;
  var totalScore = 0;
  var theme = Colors.green[300];
  List data = [];
  final List texts = [
    {
      'question': 'What is your favorite color?',
      'answer': [
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 8},
        {'text': 'Orange', 'score': 4},
        {'text': 'Blue', 'score': 2}
      ]
    },
    {
      'question': 'Which is your favorite pet animal?',
      'answer': [
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 7},
        {'text': 'Rabbit', 'score': 10},
      ]
    },
    {
      'question': 'Which is your favorite sport?',
      'answer': [
        {'text': 'Cricket', 'score': 10},
        {'text': 'Football', 'score': 7},
        {'text': 'BasketBall', 'score': 6},
        {'text': 'Table Tenis', 'score': 5},
      ]
    },
    {
      'question': 'Who according to you is the best?',
      'answer': [
        {'text': 'Facebook', 'score': 4},
        {'text': 'Google', 'score': 10},
        {'text': 'Apple', 'score': 7},
        {'text': 'Microsoft', 'score': 6},
      ]
    },
  ];
  final _names = ['Apple','Ball'];
  void buttonPressed(int score) {
    setState(() {
      totalScore += score;
      index += 1;
    });
  }

  String get result {
    var resultText = ' ';

    if (totalScore > 8 && totalScore < 28) {
      resultText = 'You have partially good taste !!!';
    } else if (totalScore == 38) {
      resultText = 'Your Taste is Best !!!';
    } else {
      resultText = 'You donot have good taste !!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Ncit'),
            backgroundColor: theme,
          ),
          body: index < texts.length
              ? /*Column(
                  children: <Widget>[
                    TextArea(
                      texts[index]['question'],
                    ),
                    ...(texts[index]['answer'] as List<Map<String, Object>>)
                        .map((answer) => InterfaceButton(
                            () => buttonPressed(answer['score']),
                            answer['text']))
                        .toList(),
                  ],
                )*/
          Answer(texts, buttonPressed, index)
              : Column(children: <Widget>[
                  FloatingActionButton(
                    child: Icon(
                      Icons.home,
                    ),
                    onPressed: () {
                      setState(() {
                        totalScore = 0;
                        index = 0;
                      });
                    },
                    elevation: 6,
                    backgroundColor: theme,
                  ),
                  FetchData(),
                  AddData(this._names),
                  Result(this.result),
                ],
            )
        ),
    );
  }
}
