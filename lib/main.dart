import 'package:flutter/material.dart';

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
  List<Icon> scoreKeeperIcons = [];
  List<String> ques = [
    'The smallest country in the world is Monaco.False',
    'A heptagon has six sides.False',
    'Lightning is seen before it\'s heard because light travels faster than sound.True',
    'U.S. presidents originally lived in the "President\'s Palace," but the name was changed to avoid affectations of royalty.True',
    'The biggest muscle in the human body is the gluteus maximus (buttock muscle).True',
    'The Titanic had enough lifeboats to save almost everyone on board.False',
    'Bollywood is the nickname of Britain\'s movie industry.False',
    'Only Americans and Soviets have walked on the Moon.False',
    'Vampire bats feed on blood.True',
    'When Mickey Mouse debuted on screen in 1928, it was in a silent film.False',
  ];

  int quesNum = 1;
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
                  ques[quesNum],
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
                setState(
                  () {
                    quesNum++;
                    scoreKeeperIcons.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  },
                );
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
                setState(
                  () {
                    quesNum++;
                    scoreKeeperIcons.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  },
                );
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
