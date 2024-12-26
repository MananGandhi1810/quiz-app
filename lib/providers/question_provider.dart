import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/questions.dart';

class QuestionProvider extends ChangeNotifier {
  List<QuestionModel> _questions = [];

  List<QuestionModel> get questions => _questions;

  void loadQuestions() async {
    _questions = Questions.questions['questions']
            ?.map(
              (e) => QuestionModel.fromJson(e),
            )
            .toList() ??
        [];
    notifyListeners();
  }

  QuestionModel getRandomQuestion() {
    return _questions[Random().nextInt(_questions.length)];
  }
}
