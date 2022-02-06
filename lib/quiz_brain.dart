import 'dart:developer';

import 'question.dart';

class QuizBrain {
  int _counter = 0;
  List<Question> _questions = [
    Question("You can lead a cove down stairs but not ip stairs.", false),
    Question("Approximately one quarter of human bones are in the feet.", true),
    Question("A slug's blood is green.", true)
  ];

  int get QuestionCount {
    return _questions.length;
  }

  int get Counter {
    return _counter;
  }

  void nextQuestion() {
    if (_counter < QuestionCount - 1) {
      _counter++;
    }
  }

  void reset() {
    this._counter = 0;
  }

  get QuestionText {
    return this._questions[_counter].questionText;
  }

  get Answer {
    return this._questions[_counter].questionAnswer;
  }

  get isFinished {
    return this._counter == QuestionCount - 1;
  }
}
