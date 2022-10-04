import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'questionBank.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF0F0F0),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text(
              'Quizzler',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            centerTitle: true,
          ),
          body: Quizler(),
        ),
      ),
    );
  }
}

class Quizler extends StatefulWidget {
  const Quizler({Key? key}) : super(key: key);

  @override
  State<Quizler> createState() => _QuizlerState();
}

class _QuizlerState extends State<Quizler> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeperIcons = [];
  score(bool userAns) {
    setState(() {
      if (userAns == quizBrain.quesAns()) {
        scoreKeeperIcons.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scoreKeeperIcons.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  quizBrain.quesText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)),
              onPressed: () {
                quizBrain.nextQues();
                score(true);
              },
              child: Text(
                'True',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          SizedBox(
            height: 1.0,
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              onPressed: () {
                quizBrain.nextQues();
                score(false);
              },
              child: Text(
                'False',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          Row(
            children: scoreKeeperIcons,
          )
        ],
      ),
    );
  }
}
