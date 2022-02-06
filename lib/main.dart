import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: QuizPage(),
          ))),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool isCorrect) {
    print(quizBrain.Counter);
    setState(() {
      if (quizBrain.isFinished) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        scoreKeeper.add(Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.green : Colors.red,
        ));
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrain.QuestionText ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () => {checkAnswer(quizBrain.Answer == true)},
                  child: Text("True",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ))),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () => {checkAnswer(quizBrain.Answer == false)},
                  child: Text("False",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ))),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
