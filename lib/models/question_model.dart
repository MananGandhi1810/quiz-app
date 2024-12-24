enum Difficulty { easy, medium, hard }

class QuestionModel {
  late String question;
  late Map options;
  late String answer;
  late Difficulty difficulty;

  QuestionModel({
    required question,
    required options,
    required answer,
    required difficulty,
  });

  QuestionModel.fromJson(data) {
    question = data['question'];
    options = data['options'];
    answer = data['answer'];
    difficulty = Difficulty.values.byName(data['difficulty']);
  }
}
