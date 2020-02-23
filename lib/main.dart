import 'package:flutter/material.dart';
import 'desc.dart';
import 'outcome.dart';
import 'yesnobutton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How are you',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'How Are You'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void changeToDescPage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Description(
              questions[counter]['dis'], questions[counter]['desc']);
        },
      ),
    );
  }

  void changeTofinalPage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Outcome();
        },
      ),
    );
  }

  String initialText = "Are you suffering from ";
  List questions = [
    {
      'dis': 'cough',
      'desc': 'Expel air from the lungs with a sudden sharp sound.',
    },
    {
      'dis': 'fever',
      'desc':
          'An abnormally high body temperature, usually accompanied by shivering, headache, and in severe instances, delirium.'
    },
    {'dis': 'shortness of breath', 'desc': 'Shortness of breath'},
    {
      'dis': 'non-productive cough',
      'desc':
          'A nonproductive cough, also known as a dry cough, doesn\'t produce phlegm or mucus.'
    },
    {
      'dis': 'chill',
      'desc':
          'An unpleasant feeling of coldness in the atmosphere, one\'s surroundings, or the body.'
    },
    {
      'dis': 'wheezing',
      'desc': 'Breathing with a whistling or rattling sound in the chest.'
    },
    {'dis': 'night sweat', 'desc': 'Sweating in the night.'},
  ];

  String theQuestionOnScreen = 'Are you suffering from cough ?';
  int counter = 0;
  void changeQuestion() {
    if (counter < questions.length) {
      if (counter == questions.length - 1) {
        changeTofinalPage(context);
      } else
        setState(() {
          theQuestionOnScreen =
              initialText + questions[++counter]['dis'] + ' ?';
          print('Counter is $counter');
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  theQuestionOnScreen,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                YesNoButton("Yes", changeQuestion),
                YesNoButton("No", changeQuestion),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.question_answer),
        onPressed: () {
          changeToDescPage(context);
        },
      ),
    );
  }
}
