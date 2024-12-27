import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/providers/question_provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuestionModel? _question;
  String? _submittedAnswer;

  @override
  void initState() {
    super.initState();
    setState(() {
      _question = context.read<QuestionProvider>().getRandomQuestion();
    });
  }

  void submitAnswer(String answer) {
    if (_submittedAnswer != null) {
      return;
    }
    setState(() {
      _submittedAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question"),
        centerTitle: true,
      ),
      body: _question != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      _question?.question ?? "",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => submitAnswer(_question?.options[0]),
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(2),
                        backgroundColor: WidgetStatePropertyAll(
                          _submittedAnswer != null
                              ? _question?.answer == _question?.options[0]
                                  ? Colors.green
                                  : _submittedAnswer == _question?.options[0]
                                      ? Colors.red
                                      : Colors.white
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        _question?.options[0] ?? "",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => submitAnswer(_question?.options[1]),
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(2),
                        backgroundColor: WidgetStatePropertyAll(
                          _submittedAnswer != null
                              ? _question?.answer == _question?.options[1]
                                  ? Colors.green
                                  : _submittedAnswer == _question?.options[1]
                                      ? Colors.red
                                      : Colors.white
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        _question?.options[1] ?? "",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => submitAnswer(_question?.options[2]),
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(2),
                        backgroundColor: WidgetStatePropertyAll(
                          _submittedAnswer != null
                              ? _question?.answer == _question?.options[2]
                                  ? Colors.green
                                  : _submittedAnswer == _question?.options[2]
                                      ? Colors.red
                                      : Colors.white
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        _question?.options[2] ?? "",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => submitAnswer(_question?.options[3]),
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(2),
                        backgroundColor: WidgetStatePropertyAll(
                          _submittedAnswer != null
                              ? _question?.answer == _question?.options[3]
                                  ? Colors.green
                                  : _submittedAnswer == _question?.options[3]
                                      ? Colors.red
                                      : Colors.white
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        _question?.options[3] ?? "",
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
