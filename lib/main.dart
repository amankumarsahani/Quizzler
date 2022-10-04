import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFF0F0F0),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              'Quizzler',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
          body: const Quizler(),
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
  int scoreBoard = 0;
  score(bool userAns) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "CONGRATULATIONS",
                desc:
                    "You have Completed your Quiz and Your Score is : $scoreBoard")
            .show();

        quizBrain.reset();
        scoreKeeperIcons = [];
        scoreBoard = 0;
      } else {
        if (userAns == quizBrain.quesAns()) {
          scoreBoard++;
          scoreKeeperIcons.add(
            const Icon(Icons.check, color: Colors.green),
          );
        } else {
          scoreKeeperIcons.add(
            const Icon(Icons.close, color: Colors.red),
          );
        }
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
            flex: 9,
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
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "*Important Note : Don't Try to switch the tabs as It may crash your Application.",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(
            height: 1.0,
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
              child: const Text(
                'True',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          const SizedBox(
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
              child: const Text(
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
