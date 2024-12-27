import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _total = 0;
  int _correct = 0;

  int get total => _total;
  int get correct => _correct;

  void resetScore() {
    _total = 0;
    _correct = 0;
    notifyListeners();
  }

  void submitAnswer(bool answerCorrect) {
    _total++;
    if (answerCorrect) {
      _correct++;
    }
    notifyListeners();
  }
}
