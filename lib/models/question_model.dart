class QuestionModel {
  late String question;
  late List options;
  late String answer;

  QuestionModel({
    required question,
    required options,
    required answer,
  });

  QuestionModel.fromJson(data) {
    question = data['question'];
    options = data['options'];
    answer = data['answer'];
  }
}
